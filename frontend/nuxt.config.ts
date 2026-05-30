export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',

  devtools: { enabled: true },

  modules: [
    '@pinia/nuxt'
  ],

  nitro: {
    routeRules: {
      '/api/**': {
        proxy: process.env.BACKEND_URL ? `${process.env.BACKEND_URL}/**` : 'http://localhost:8080/academics/api/**'
      }
    }
  },

  runtimeConfig: {
    public: {
      apiBase: '/api'
    }
  }
})