<template>
  <div>
    <nav>
      <ul>
        <li><router-link to="decks">Decks</router-link></li>
        <li></li>
      </ul>
    </nav>
    <h1>Main</h1>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  data: function () {
    return {

    }
  }
}
</script>