import Vue from 'vue'
import GameTranslations from './GameTranslations.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(GameTranslations, {
      props: {
        data: JSON.parse(document.querySelector('#data').getAttribute('data'))

      }
    })
  }).$mount()
  document.body.appendChild(app.$el)
})