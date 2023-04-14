<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div class="bg-grey-lighter min-h-screen flex flex-col">
    <div
      class="container max-w-sm mx-auto flex-1 flex flex-col items-center justify-center px-2"
    >
      <div class="bg-white px-6 py-8 rounded shadow-md text-black w-full">
        <h1 class="mb-8 text-3xl text-center">Sign up</h1>
        <input
          type="text"
          class="block border border-grey-light w-full p-3 rounded mb-4"
          name="first_name"
          placeholder="First Name"
          v-model="first_name"
        />
        <input
          type="text"
          class="block border border-grey-light w-full p-3 rounded mb-4"
          name="last_name"
          placeholder="Last Name"
          v-model="last_name"
        />

        <input
          type="text"
          class="block border border-grey-light w-full p-3 rounded mb-4"
          name="email"
          placeholder="Email"
          v-model="email"
        />

        <input
          type="password"
          class="block border border-grey-light w-full p-3 rounded mb-4"
          name="password"
          placeholder="Password"
          v-model="password"
        />
        <input
          type="password"
          class="block border border-grey-light w-full p-3 rounded mb-4"
          name="confirm_password"
          placeholder="Confirm Password"
          v-model="confirm_password"
        />

        <button
          type="submit"
          class="w-full text-center py-3 rounded bg-green hover:bg-green-dark focus:outline-none my-1"
          @click="submit"
        >
          Create Account
        </button>

        <div class="text-center text-sm text-grey-dark mt-4">
          By signing up, you agree to the
          <a
            class="no-underline border-b border-grey-dark text-grey-dark"
            href="#"
          >
            Terms of Service
          </a>
          and
          <a
            class="no-underline border-b border-grey-dark text-grey-dark"
            href="#"
          >
            Privacy Policy
          </a>
        </div>
      </div>

      <div class="text-grey-dark mt-6">
        Already have an account?

        <router-link to="/login">Login</router-link>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Register",
  data() {
    return {
      first_name: null,
      last_name: null,
      email: null,
      password: null,
      confirm_password: null,
    };
  },
  methods: {
    submit(e) {
      e.preventDefault();
      const request = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        confirm_password: this.confirm_password,
      };
      axios
        .post("http://localhost:3000/register", request)
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
