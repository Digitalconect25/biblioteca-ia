import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { createSupabaseAdmin } from '../../lib/supabase/server';

export const prerender = false;

const json = (data: unknown, status = 200) =>
  new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json' },
  });

// Mapa de Stripe Product ID → product_slug interno (extensible para futuras guías).
const PRODUCT_SLUGS: Record<string, string> = {
  prod_Uc8DC2eB3hixYQ: 'codex-de-cero-a-cien',
};

export const POST: APIRoute = async ({ request }) => {
  const secretKey = import.meta.env.STRIPE_SECRET_KEY;
  const webhookSecret = import.meta.env.STRIPE_WEBHOOK_SECRET;

  if (!secretKey || !webhookSecret) {
    // Sin secretos configurados, rechazamos por seguridad.
    return json({ error: 'Webhook no configurado en el servidor' }, 500);
  }

  const stripe = new Stripe(secretKey);
  const sig = request.headers.get('stripe-signature');
  if (!sig) return json({ error: 'Falta stripe-signature' }, 400);

  const body = await request.text();
  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(body, sig, webhookSecret);
  } catch (err: any) {
    return json({ error: `Firma inválida: ${err.message}` }, 400);
  }

  const supabase = createSupabaseAdmin();

  if (event.type === 'checkout.session.completed') {
    const session = event.data.object as Stripe.Checkout.Session;
    const email =
      session.customer_email ||
      session.customer_details?.email ||
      '';
    if (!email) return json({ ok: true, ignored: 'sin email' });

    // Resolver product_slug: tomamos los line items para sacar el product ID.
    let productSlug = 'codex-de-cero-a-cien'; // fallback (solo tenemos una guía hoy)
    try {
      const items = await stripe.checkout.sessions.listLineItems(session.id, {
        limit: 1,
        expand: ['data.price.product'],
      });
      const productId =
        typeof items.data[0]?.price?.product === 'string'
          ? items.data[0].price.product
          : items.data[0]?.price?.product?.id;
      if (productId && PRODUCT_SLUGS[productId]) {
        productSlug = PRODUCT_SLUGS[productId];
      }
    } catch {
      // Fallback al default si falla la consulta.
    }

    const userId = session.client_reference_id || null;
    const piId =
      typeof session.payment_intent === 'string'
        ? session.payment_intent
        : session.payment_intent?.id || null;
    const customerId =
      typeof session.customer === 'string'
        ? session.customer
        : session.customer?.id || null;

    const { error } = await supabase.from('academia_purchases').upsert(
      {
        user_id: userId,
        email: email.toLowerCase(),
        product_slug: productSlug,
        stripe_session_id: session.id,
        stripe_payment_intent: piId,
        stripe_customer: customerId,
        amount: session.amount_total ?? 0,
        currency: session.currency || 'usd',
        status: 'paid',
      },
      { onConflict: 'stripe_session_id' },
    );
    if (error) {
      return json({ error: 'No se pudo guardar la compra', detail: error.message }, 500);
    }
  } else if (event.type === 'charge.refunded') {
    // Marcar como refunded si se reembolsa.
    const charge = event.data.object as Stripe.Charge;
    const pi = typeof charge.payment_intent === 'string' ? charge.payment_intent : null;
    if (pi) {
      await supabase
        .from('academia_purchases')
        .update({ status: 'refunded' })
        .eq('stripe_payment_intent', pi);
    }
  }

  return json({ ok: true, received: event.type });
};
