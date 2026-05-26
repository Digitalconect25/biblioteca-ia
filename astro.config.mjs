// @ts-check
import { defineConfig } from 'astro/config';

// Sitio estático. El buscador (Pagefind) se genera en `npm run build`.
export default defineConfig({
  site: 'https://biblioteca-ia.example',
  build: {
    format: 'directory',
  },
});
