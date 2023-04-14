<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div v-if="recipies.length > 0">
    <div v-for="recipe in recipies" v-bind:key="recipe.id" class="flex">
      <div class="max-w-sm rounded overflow-hidden shadow-lg flex flex-row">
        <img class="w-full" :src="recipe.recipe_image" alt="" />
        <div class="px-6 py-4">
          <div class="font-bold text-xl mb-2">{{ recipe.title }}</div>
          {{ recipe.ingredient }}
        </div>
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
