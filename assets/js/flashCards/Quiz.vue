<template>
  <div class="bg-gray-700 text-gray-300 h-screen">
  <div class="antialiased flex flex-wrap justify-center m-4">
    <h1 class="w-full text-6xl text-center">冬</h1>
    <h2 class="w-full text-center text-3xl text-blue-200">意味は？</h2>
    <h2 class="w-full text-center text-3xl text-green-400">正解！</h2>
    <h2 class="w-full text-center text-3xl text-red-400">違う...</h2>
    <div>
      <ul>
        <li class="text-xl">
          <span class="font-bold">意味:</span>
          winter, winter, winter
        </li>
        <li>
          <span class="font-bold">訓読み:</span>
          ふゆ
        </li>
        <li>
          <span class="font-bold">音読み:</span>
          トウ
        </li>
      </ul>
    </div>
  </div>

  <div class="flex flex-wrap justify-center antialiased md:w-1/2 w-3/4 mx-auto">
    <input
      class="rounded py-3 px-2 block w-full my-4 bg-gray-800 text-gray-100 border border-gray-100"
      placeholder=""
    />
    <button class="p-3 border border-gray-100 w-1/2 rounded hover:bg-gray-800 transition duration-300">Submit</button>
  </div>
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