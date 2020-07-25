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
      <div class="py-6 md:w-1/2 sm:w-full lg:w-1/3 px-2 text-center">
        <svg class="stroke-current text-blue-600 h-12 w-12" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 4v16m8-8H4"></path></svg>
      </div>
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