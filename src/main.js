import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '../public/iconfont/iconfont.css'

import axios from './axios'
Vue.use(axios);

import { Carousel, CarouselItem, Pagination } from 'element-ui';
Vue.use(Carousel);
Vue.use(CarouselItem);
Vue.use(Pagination);

import Header from './components/Header.vue'
import Footer from './components/Footer.vue'
import CakeSweetness from './components/CakeSweetness.vue'
import Card from './components/Card.vue'
Vue.component('my-header', Header);
Vue.component('my-footer', Footer);
Vue.component('cake-sweetness', CakeSweetness);
Vue.component('my-card', Card);

Vue.config.productionTip = false;
Vue.prototype.axios = axios;

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')