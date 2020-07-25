import Decks from './Decks.vue'
import Quiz from './Quiz.vue'
import VueRouter from 'vue-router'

const routes = [
  { path: '/decks', component: Decks },
  { path: '/quiz/:deckId', component: Quiz }
]

export default new VueRouter({
  routes
})
