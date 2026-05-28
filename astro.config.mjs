// @ts-check
import { defineConfig } from 'astro/config';
import vercel from '@astrojs/vercel';

// Híbrido: las páginas de contenido se prerenderizan (estáticas, indexadas por
// Pagefind); solo las rutas con sesión (login, dashboard, api, etc.) se marcan
// con `export const prerender = false` para renderizarse on-demand en Vercel.
export default defineConfig({
  site: 'https://biblioteca-ia.vercel.app',
  output: 'static',
  adapter: vercel(),
  build: {
    format: 'directory',
  },
});
