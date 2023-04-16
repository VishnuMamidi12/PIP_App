<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div
    class="font-sans text-black w-full bg-fuchsia-900 flex items-center justify-center absolute top-0 pr-12"
  >
    <div class="border rounded overflow-hidden flex bg-white">
      <input type="text" class="px-4 py-2" placeholder="Search..." />
      <button class="flex items-center justify-center px-4 border-l">
        <svg
          class="h-4 w-4 text-grey-dark"
          fill="currentColor"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
        >
          <path
            d="M16.32 14.9l5.39 5.4a1 1 0 0 1-1.42 1.4l-5.38-5.38a8 8 0 1 1 1.41-1.41zM10 16a6 6 0 1 0 0-12 6 6 0 0 0 0 12z"
          />
        </svg>
      </button>
    </div>
    <div class="flex text-white absolute right-10">
      <router-link to="/recipe_create" class="">Crete a new recipe</router-link>
    </div>
  </div>
  <div
    v-if="recipies.length > 0"
    class="flex flex-row pt-6 flex flex-wrap lg:-mx-1 lg:-mx-4"
  >
    <div
      v-for="recipe in recipies"
      v-bind:key="recipe.id"
      class="my-1 px-1 md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3"
    >
      <div class="max-w-sm rounded overflow-hidden shadow-lg h-80">
        <a :href="recipe.recipe_url">
          <img class="w-full" :src="recipe.recipe_image" alt="" />

          <div class="px-6 py-4">
            <div class="font-bold text-xl mb-2">
              {{ recipe.title }}
            </div>
          </div>
        </a>
        <div class="px-6 pt-4 pb-2"></div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "RecipeList",
  data() {
    return {
      recipies: [],
      title: " ",
      ingredients: " ",
      cooking_instructions: " ",
      time_taken: " ",
      cusine_type: " ",
      is_public: false,
      dietary_restrictions: " ",
    };
  },
  created() {
    this.fetchRecipies();
  },
  methods: {
    fetchRecipies() {
      axios
        .get("http://localhost:3000/recipes/item")
        .then((res) => {
          console.log(res);
          this.recipies = res.data.recipes;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
<style scoped></style>
