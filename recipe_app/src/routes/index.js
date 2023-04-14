// import Recipe_form from '../components/Recipe_form.vue';
// // import {createRouter, createWebHistory} from "vue-router";
// import Register from '../components/Register.vue';
// // import Login from '../components/Login.vue';
// // import Data ../components/RecipeList.vueta.vue';
// import Router from 'vue-router'
// import Vue from 'vue'

// Vue.use(Router)

// //Vue.use(VueRouter);


// // const routes = [
// //   { path: '/', component: Recipe_form, template:'<router-view/>', children:[
// //     { path: '/register', component: Register },
// //     { path: '/login', component: Login},
// //     { path: '/list', component: Data}
// //   ] }
// // ]

// const router = Router({
//   // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
// //  history: createWebHistory(),
//   mode: "history",
//   // routes, // short for `routes: routes`
//   routes: [
//     {
//       path: '/',
//       component: Recipe_form,
//       name: 'root'
//     },
//     {
//       path: '/register',
//       component: Register,
//       name: 'register'
//     }
//   ]
// })

// export default router




// import Recipe_form from '../components/Recipe_form.vue';
// // import {createRouter, createWebHistory} from "vue-router";
import Recipe_from from '../components/Recipe_form.vue'
import Register from '../components/Register.vue';
import Login from '../components/Login.vue';
import Recipes from "../components/RecipeList.vue";
// import Data from '../components/Data.vue';
// import Router from 'vue-router'
// import Vue from 'vue'

import { createWebHistory, createRouter } from "vue-router";
// import Home from "@/views/Home.vue";
// import About from "@/views/About.vue";

const routes = [
  {
    path: '/recipe_create',
    name: 'home',
    component: Recipe_from
  },
  {
    path: "/login",
    name: "Home",
    component: Login,
  },
  {
    path: "/register",
    name: "About",
    component: Register,
  },
  {
    path: '/recipes',
    name: 'recipeis',
    component: Recipes,
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;