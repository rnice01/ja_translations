import Decks from './Decks.vue'
import VueRouter from 'vue-router'

const routes = [
  { path: '/decks', component: Decks }
]

export default new VueRouter({
  routes
})
