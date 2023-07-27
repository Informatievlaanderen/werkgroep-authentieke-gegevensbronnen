import type { NuxtConfig } from '@nuxt/types'

const config: NuxtConfig = {
  target: 'static',
  head: {
    title: 'AGB Register',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [
      {
        rel: 'icon',
        sizes: '192x192',
        href: 'https://dij151upo6vad.cloudfront.net/2.latest/icons/app-icon/icon-highres-precomposed.png',
      },
      {
        rel: 'apple-touch-icon',
        href: 'https://dij151upo6vad.cloudfront.net/2.latest/icons/app-icon/touch-icon-iphone-precomposed.png',
      },
      {
        rel: 'apple-touch-icon',
        sizes: '76x76',
        href: 'https://dij151upo6vad.cloudfront.net/2.latest/icons/app-icon/touch-icon-ipad-precomposed.png',
      },
      {
        rel: 'apple-touch-icon',
        sizes: '120x120',
        href: 'https://dij151upo6vad.cloudfront.net/2.latest/icons/app-icon/touch-icon-iphone-retina-precomposed.png',
      },
      {
        rel: 'apple-touch-icon',
        sizes: '152x152',
        href: 'https://dij151upo6vad.cloudfront.net/2.latest/icons/app-icon/touch-icon-ipad-retina-precomposed.png',
      },
    ],
  },
  // Global CSS: https://nuxt.com/docs/api/configuration/nuxt-config#css
  css: ['~/css/styles.scss'],
  // Plugins to run before rendering page: https://nuxt.com/docs/api/configuration/nuxt-config#plugins-1
  plugins: [{ src: '~/plugins/webcomponents.js', mode: 'client' }],
  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    '@nuxt/typescript-build',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/content
    '@nuxt/content',
  ],

  // Content module configuration: https://go.nuxtjs.dev/config-content
  content: {},

  // router: {
  //   base: '/authentieke_gegevensbronnen/'
  // },

  generate: {
    fallback: true,
  },
}

export default config
