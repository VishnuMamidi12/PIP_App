<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div class="bg-blue-200 min-h-screen flex items-center">
    <div class="w-full">
      <h2 class="text-center text-blue-400 font-bold text-2xl uppercase mb-10">
        Recipe Form
      </h2>
      <div class="bg-white p-5 rounded-lg shadow md:w-3/4 mx-auto lg:w-2/5">
        <form action="">
          <div class="mb-5">
            <label
              for="title"
              class="block mb-2 font-bold text-gray-600 text-left"
              >Recipe Name</label
            >
            <input
              type="text"
              id="title"
              name="title"
              class="border border-gray-300 shadow p-3 w-full rounded mb-"
              v-model="title"
            />
          </div>

          <div class="mb-5">
            <label
              for="ing"
              class="block mb-2 font-bold text-gray-600 text-left"
              >Ingredients</label
            >
            <input
              type="text"
              id="ing"
              name="ing"
              class="border p-3 w-full rounded mb-"
              v-model="ingredients"
            />
          </div>

          <div class="mb-5">
            <label for="ci" class="block mb-2 font-bold text-gray-600 text-left"
              >Cooking Instructions</label
            >
            <input
              type="text"
              id="ci"
              name="ci"
              class="border p-3 w-full rounded mb-"
              v-model="cooking_instructions"
            />
          </div>

          <div class="mb-5">
            <label for="tt" class="block mb-2 font-bold text-gray-600 text-left"
              >Time Taken</label
            >
            <input
              type="number"
              id="tt"
              name="tt"
              class="border p-3 w-full rounded mb-"
              v-model="time_taken"
            />
          </div>

          <div class="mb-5">
            <label for="ct" class="block mb-2 font-bold text-gray-600 text-left"
              >Cuisine Type</label
            >
            <input
              type="text"
              id="ct"
              name="ct"
              class="border p-3 w-full rounded mb-"
              v-model="cusine_type"
            />
          </div>

          <div class="mb-5">
            <label
              for="restrictions"
              class="block mb-2 font-bold text-gray-600 text-left"
              >Dietary Restrictions</label
            >
            <input
              type="text"
              id="restrictions"
              name="restrictions"
              class="border p-3 w-full rounded mb-"
              v-model="dietary_restrictions"
            />
          </div>

          <button
            class="block w-full bg-blue-500 text-white font-bold p-4 rounded-lg"
            @click="submit"
          >
            Submit
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Recipe_form",
  data() {
    return {
      title: " ",
      ingredients: " ",
      cooking_instructions: " ",
      time_taken: " ",
      cusine_type: " ",
      is_public: false,
      dietary_restrictions: " ",
    };
  },
  methods: {
    submit(e) {
      e.preventDefault();
      console.log(this.title);
      let recipeData = new window.FormData();
      recipeData.append("title", this.title);
      recipeData.append("time_tiken", this.time_taken);
      recipeData.append("ingredient", this.ingredients);
      recipeData.append("cooking_instructions", this.cooking_instructions);
      recipeData.append("cuisine_type", this.cusine_type);
      //recipeData.append("is_public", this.is_public);
      recipeData.append("dietary_restrictions", this.dietary_restrictions);

      axios
        .post("http://localhost:3000/recipes", recipeData)
        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style></style>
