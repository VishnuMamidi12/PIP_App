<template>
  <div
    class="font-sans text-black w-full bg-fuchsia-900 flex items-center justify-center absolute top-0"
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
    <div class="flex text-white pl-20">
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
      Recipe Ingredients:{{ recipe.ingredient }}
    </div>
    <div class="font-bold text-xl mb-1">
      Cooking Instructions: {{ recipe.cooking_instructions }}
    </div>
    <div class="font-bold text-xl mb-2">
      Time Taken:
      {{ recipe.time_tiken }}
    </div>
    <div class="font-bold text-xl mb-2">
      Cusine Type: {{ recipe.cuisine_type }}
    </div>
    <div class="font-bold text-xl mb-2">
      Dietary Restrictions: {{ recipe.dietary_restrictions }}
    </div>
  </div>

  <footer
    class="bg-fuchsia-900 text-center text-white absolute inset-x-0 bottom-0"
  >
    <!--Copyright section-->
    <div class="p-4 text-center" style="background-color: rgba(0, 0, 0, 0.2)">
      <div
        class="gird-cols-1 grid items-center justify-center gap-4 md:grid-cols-3"
      >
        <div class="md:mb-6 md:ml-auto">
          <p class="text-secondary-800 dark:text-secondary-200">
            <strong>Please enter your email To subscribe </strong>
          </p>
        </div>

        <div class="relative md:mb-6" data-te-input-wrapper-init>
          <input
            type="text"
            class="peer block min-h-[auto] w-full rounded border-0 bg-white px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:placeholder:text-secondary-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
            id="exampleFormControlInput1"
            placeholder="Email address"
          />
          <!-- <label
            for="exampleFormControlInput1"
            class="text-black pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-secondary-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-secondary-200 dark:peer-focus:text-secondary-200"
            >Email address
          </label> -->
        </div>

        <div class="mb-6 md:mr-auto">
          <button
            type="button"
            class="inline-block rounded bg-primary px-6 pb-2 pt-2.5 text-xs font-medium uppercase leading-normal text-white shadow-[0_4px_9px_-4px_#3b71ca] transition duration-150 ease-in-out hover:bg-white-600 hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:bg-primary-600 focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:outline-none focus:ring-0 active:bg-primary-700 active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)]"
            data-te-ripple-init
          >
            Subscribe
          </button>
        </div>
      </div>

      © 2023 Copyright:
      <a class="text-whitehite" href="#">Food Recipe</a>
    </div>
  </footer>
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
