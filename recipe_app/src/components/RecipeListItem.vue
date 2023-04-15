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
  <div class="grid justify-items-center">
    <img class="object-fill h-48 w-96" :src="recipe.recipe_image" alt="" />
  </div>
  <div class="text-fuchsia-900">
    <div class="px-6 py-4">
      <div class="font-bold text-xl mb-2">Recipe Name:{{ recipe.title }}</div>
    </div>
    <div class="font-bold text-xl mb-1">
      Cooking Instructions: {{ recipe.cooking_instructions }}
    </div>
    <div class="font-bold text-xl mb-2">
      Time Taken: {{ recipe.time_tiken }}
    </div>
    <div class="font-bold text-xl mb-2">
      Cusine Type: {{ recipe.cuisine_type }}
    </div>
    <div class="font-bold text-xl mb-2">
      Dietary Restrictions: {{ recipe.dietary_restrictions }}
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "RecipeListItem",
  data() {
    return {
      recipe: [],
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
      const id = this.$route.params.id;
      axios
        .get(`http://localhost:3000/title/${id}`)
        .then((res) => {
          console.log(res);
          console.log(res);
          this.recipe = res.data;
          console.log(this.recipe);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
