/// <reference types="astro/client" />

interface ImportMetaEnv {
  readonly PUBLIC_SUPABASE_URL: string;
  readonly PUBLIC_SUPABASE_ANON_KEY: string;
  /** Solo server-side. Nunca exponer al cliente. */
  readonly SUPABASE_SERVICE_ROLE_KEY: string;
  /** Stripe — solo server-side. */
  readonly STRIPE_SECRET_KEY: string;
  readonly STRIPE_WEBHOOK_SECRET: string;
  /** Payment Link (puede ser PUBLIC, lo usa el botón Comprar). */
  readonly PUBLIC_STRIPE_PAYMENT_LINK: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}

declare namespace App {
  interface Locals {
    supabase: import('@supabase/supabase-js').SupabaseClient;
    user: import('@supabase/supabase-js').User | null;
  }
}
