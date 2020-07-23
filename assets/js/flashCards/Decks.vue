<template>
  <div>
    <h1>Decks</h1>
    <div class="flex flex-wrap justify-between p-6">
      <DeckCard
      v-for="dc in decks"
      :key="'deck-card-' + dc.id"
      :id="dc.id"
      :title="dc.title"
      :description="dc.description"
      :numberOfCards="dc.numberOfCards"
      ></DeckCard>
    </div>
  </div>
</template>

<script>
 import DeckCard from './decks/DeckCard'

  export default {
    data: function () {
      return {
        decks: [
          {
            id: 1,
            title: "JLPT N5 Kanji",
            description: "My deck for studying kanji for the JLPT N5",
            numberOfCards: 500
          },
          {
            id: 2,
            title: "JLPT N5 Kanji",
            description: "My deck for studying kanji for the JLPT N5",
            numberOfCards: 500
          },
          {
            id: 3,
            title: "JLPT N5 Kanji",
            description: "My deck for studying kanji for the JLPT N5",
            numberOfCards: 500
          },
          {
            id: 4,
            title: "JLPT N5 Kanji",
            description: "My deck for studying kanji for the JLPT N5",
            numberOfCards: 500
          }
        ]
      }
    },
    components: {
      DeckCard
    }
  }
</script>