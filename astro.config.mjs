// @ts-check
import { defineConfig } from 'astro/config';

import vue from '@astrojs/vue';
import sitemap from '@astrojs/sitemap';

import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  vite: {
    plugins: [tailwindcss()]
  },

  site: "https://jamesbarret.co.uk",
  integrations: [vue(), sitemap()]
});