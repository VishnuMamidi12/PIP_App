// //import { application } from 'express'
// import { createApp } from 'vue'
// import App from './App.vue'
import { createApp } from 'vue'
import App from './App.vue'
import router from './routes'
import './assets/tailwind.css'

createApp(App)
  .use(router)
  .mount('#app')
// import router from './routes'
// import Vue from 'vue'

// const app = createApp({})
// app.use(router)

// app.mount('#app')

// const vueApp = new Vue({
//     el: '#app',
//     router,
//     template: '<App/>',
//     components: {
//       App
//     }
//   })

// export default { vueApp }