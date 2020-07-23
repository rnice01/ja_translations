<template>
  <div class="py-6 md:w-1/2 sm:w-full lg:w-1/3 px-2">
    <div class="flex bg-white shadow-lg rounded-lg overflow-hidden">
      <div class="w-1/3 bg-cover"
        style="background-image: url('https://images.unsplash.com/photo-1494726161322-5360d4d0eeae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80')">
      </div>
      <div class="w-2/3 p-4">
        <h1 class="text-gray-900 font-bold text-2xl">{{title}}</h1>
        <p class="mt-2 text-gray-600 text-sm">{{description}}</p>
        <div class="flex flex-wrap item-center mt-2">
          <p class="w-100">Cards in this deck: {{numberOfCards}}</p>
        </div>
        <div class="flex justify-end mt-3">
          <div class="m-2">
            <svg class="stroke-current text-blue-600 h-6 w-6" viewBox="0 0 24 24" fill="none" stroke-width="2">
              <path
                d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z">
              </path>
            </svg>
          </div>
          <div class="m-2">
            <svg class="stroke-current text-red-600 h-6 w-6" fill="none" stroke-linecap="round" stroke-linejoin="round"
              stroke-width="2" viewBox="0 0 24 24">
              <path
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
              </path>
            </svg>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      id: {
        type: Number,
        required: true
      },
      title: {
        type: String,
        required: true
      },
      description: {
        type: String,
        default: ''
      },
      numberOfCards: {
        type: Number,
        default: 0
      },
      image: {
        type: String,
        default: ''
      }
    },
    data: function () {
      return {

      }
    }
  }
</script>