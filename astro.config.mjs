// @ts-check
import { defineConfig } from 'astro/config';
import vercel from '@astrojs/vercel';
import sitemap from '@astrojs/sitemap';

// Híbrido: las páginas de contenido se prerenderizan (estáticas, indexadas por
// Pagefind); solo las rutas con sesión (login, dashboard, api, etc.) se marcan
// con `export const prerender = false` para renderizarse on-demand en Vercel.
export default defineConfig({
  site: 'https://academia.conectanex.com',
  output: 'static',
  adapter: vercel(),
  integrations: [
    sitemap({
      // Excluir páginas privadas / no indexables del sitemap.
      filter: (page) =>
        !page.includes('/login') &&
        !page.includes('/registro') &&
        !page.includes('/dashboard') &&
        !page.includes('/mi-progreso') &&
        !page.includes('/certificados') &&
        !page.includes('/recuperar-password') &&
        !page.includes('/actualizar-password') &&
        !page.includes('/logout') &&
        !page.includes('/api/'),
    }),
  ],
  build: {
    format: 'directory',
  },
});
