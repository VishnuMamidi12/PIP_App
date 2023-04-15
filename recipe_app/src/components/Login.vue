<!-- eslint-disable vue/multi-word-component-names -->
<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div class="h-full">
    <!-- Left column container with background-->
    <div
      class="g-6 flex h-full flex-wrap items-center justify-center lg:justify-between"
    >
      <!-- Right column container -->
      <div
        class="mb-12 md:mb-0 md:w-8/12 lg:w-5/12 xl:w-5/12 items-center justify-center"
      >
        <h1 class="mb-8 text-3xl text-center">Login</h1>
        <form>
          <!-- Email input -->
          <div class="relative mb-6 pl-10" data-te-input-wrapper-init>
            <input
              type="text"
              class="block border border-grey-light w-full p-3 rounded mb-4"
              name="first_name"
              placeholder="Email"
              v-model="email"
            />
          </div>

          <!-- Password input -->
          <div class="relative mb-6 pl-10" data-te-input-wrapper-init>
            <input
              type="text"
              class="block border border-grey-light w-full p-3 rounded mb-4"
              name="first_name"
              placeholder="Password"
              v-model="password"
            />
          </div>

          <div class="mb-6 flex items-center justify-between pl-10">
            <!-- Remember me checkbox -->
            <div>
              <button
                type="button"
                class="inline-block rounded bg-primary px-7 pb-2.5 pt-3 text-sm font-medium uppercase leading-normal shadow-[0_4px_9px_-4px_#3b71ca] transition duration-150 ease-in-out hover:bg-primary-600 hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:bg-primary-600 focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:outline-none focus:ring-0 active:bg-primary-700 active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] dark:shadow-[0_4px_9px_-4px_rgba(59,113,202,0.5)] dark:hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)]"
                data-te-ripple-init
                data-te-ripple-color="light"
                @click="submit"
              >
                Login
              </button>
            </div>

            <!--Forgot password link-->
            <a href="#!">Forgot password?</a>
          </div>

          <!-- Login button -->
          <div class="text-center lg:text-left">
            <!-- Register link -->
            <p class="mb-0 mt-2 pt-1 pl-20 text-sm font-semibold">
              Don't have an account?
              <router-link to="/register" class="text-blue-600"
                >Register Here</router-link
              >
            </p>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Login",
  data() {
    return {
      email: null,
      password: null,
    };
  },
  methods: {
    submit(e) {
      e.preventDefault();
      const request = {
        email: this.email,
        password: this.password,
      };

      axios
        .post("http://localhost:3000/login", request)
        .then((res) => {
          console.log(res);
          this.$router.push("/recipes");
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
