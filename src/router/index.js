import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
    /* {
            path: '/',
            redirect: '/header'
        }, */
    {
        path: '/',
        component: Home
    },
    {
        path: '/shoppingcar',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Shoppingcar.vue')
    },
    {
        path: '/products',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Products.vue')
    },
    {
        path: '/events',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Events.vue')
    },
    {
        path: '/brand',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Brand.vue')
    },
    {
        path: '/register',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Register.vue')
    },
    {
        path: '/login',
        component: () =>
            import ( /* webpackChunkName: "about" */ '../views/Login.vue')
    }
]

const router = new VueRouter({
    routes
})

export default router