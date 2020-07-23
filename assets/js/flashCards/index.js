import Vue from 'vue'
import router from './routes'
import App from './App.vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App, {
      props: {
        data: JSON.parse(document.querySelector('#data').getAttribute('data'))

      }
    })
  }).$mount()
  document.body.appendChild(app.$el)
})