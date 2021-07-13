import axios from "axios";
import qs from "qs";
import store from './store'

const Axios = axios.create({
        // baseURL: "http://localhost:7070/",
        withCredentials: true // 携带cookie
    })
    /* 请求拦截器 */
Axios.interceptors.request.use(
    config => {
        // console.log("进入请求拦截器...");
        //this.axios.post(
        //"user/signin",
        //{uname:dingding , upwd:123456}
        //)
        if (config.method === "post") {
            config.data = qs.stringify(config.data) // post('/', {请求的参数})，将post中req对象转为字符串（即发送post请求时，可以使用对象）
        }
        if (localStorage.getItem("token")) {
            config.headers.token = localStorage.getItem("token");
        }
        if (sessionStorage.getItem("token")) {
            config.headers.token = sessionStorage.getItem("token");
        }
        return config;
    },
    error => {
        console.log("===发送请求拦截器报错===")
        console.log(error);
        console.log("===end===");
        Promise.reject(error);
    }
);
Axios.interceptors.response.use(
    res => {
        // console.log("触发响应拦截器...")
        if (res.data.status == 403) {
            localStorage.removeItem("token");
            sessionStorage.removeItem("token");
            store.commit("setIslogin", false);
            store.commit("setPhone", "");
        } else if (res.data.code == 201) {
            store.commit("setIslogin", false);
            store.commit("setPhone", "");
            //alert(res.data.msg+" 请先登录 !");
        } else if (res.data.token) {
            store.commit("setPhone", res.data.phone);
            store.commit("setIslogin", true);
            if (res.remember === "true") {
                localStorage.setItem("token", res.data.token);
            } else {
                sessionStorage.setItem("token", res.data.token);
            }
        }
        return res;
    },
    error => {
        console.log("===接收响应拦截器报错===")
        console.log(error);
        console.log("===end===");
        Promise.reject(error);
    }
)
export default {
    install: function(Vue, Option) {
        Vue.prototype.axios = Axios;
    }
}