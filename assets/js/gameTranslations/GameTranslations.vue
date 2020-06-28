<template>
<div class="flex h-screen bg-gray-200">
        <div :class="sidebarOpen ? 'block' : 'hidden'" :click="sidebarOpen = false" class="fixed z-20 inset-0 bg-black opacity-50 transition-opacity lg:hidden hidden"></div>

        <div :class="sidebarOpen ? 'translate-x-0 ease-out' : '-translate-x-full ease-in'" class="fixed z-30 inset-y-0 left-0 w-1/6 transition duration-300 transform bg-gray-900 overflow-y-auto lg:translate-x-0 lg:static lg:inset-0 -translate-x-full ease-in">
            <div class="flex items-center justify-center mt-8">
                <div class="flex items-center">
                    <h1 class="text-white text-3xl mx-2">{{title}}</h1>
                </div>
            </div>

            <nav class="mt-10">
                <div class="flex items-center mt-4 py-2 px-6 text-gray-100 border-gray-100">
                    <div class="w-full">
                        <label for="chapter-select">Chapter: </label>
                        <select id="chapter-select" v-model="chapter" class="text-black block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                            <option value="">Select Chapter</option>
                            <option v-for="c in chapters" :key="'chapter-option-' + c.id" :value="c.id">{{c.name}}</option>
                        </select>
                    </div>
                </div>

                <div class="flex items-center mt-4 py-2 px-6 block border-l-4 border-gray-900 text-gray-500 hover:bg-gray-600 hover:bg-opacity-25 hover:text-gray-100">
                    <div class="w-full">
                        <label for="scene-select">Scene: </label>
                        <select id="scene-select" v-model="scene" class="text-black block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                            <option value="">Select Scene:</option>
                            <option v-for="s in scenes" :key="'scene-option-' + s.id" :value="s.id">{{s.title}}</option>
                        </select>
                    </div>
                </div>
            </nav>
        </div>
        <div class="flex-1 flex flex-col overflow-hidden">
            <main class="flex-1 overflow-x-hidden overflow-y-auto bg-gray-200">
                <Dialogue v-for="d in dialogue" :key="'dialgoue-id-' + d.id" :japanese="d.japanese" :english="d.english" />
            </main>
        </div>
    </div>
</template>

<script>
import Dialogue from './components/Dialogue'

export default {
  props: {
    data: {
      type: Object
    }
  },
  data: function() {
    return {
      sidebarOpen: true,
      title: '',
      scenes: [],
      chapters: [],
      dialogue: [],
      selectedChapter: '',
      selectedScene: ''
    }
  },
  computed: {
    chapter: {
      get: function () {
        return this.selectedChapter
      },
      set: function (newValue) {
        this.selectedChapter = newValue
        for (let i = 0; i < this.chapters.length; i++) {
          if (this.chapters[i].id == newValue) {
            this.scenes = this.chapters[i].scenes
            break;
          }
        }
      }
    },
    scene: {
      get: function () {
        return this.selectedScene
      },
      set: function (val) {
        this.selectedScene = val
        this.fetchScene(val)
      }
    }
  },
  methods: {
    fetchScene: function (sceneId) {
      fetch(`/api/scenes/${sceneId}`)
        .then((resp) => resp.json())
        .then((data) => {
          this.dialogue = data.dialogues
        })
    },
  },
  components: {
    Dialogue
  },
  beforeMount: function () {
    this.title = this.data.title
    this.chapters = this.data.chapters
    this.scenes = this.data.chapters[0].scenes
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
