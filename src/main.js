import './assets/main.css'
import axios from 'axios'
import VueAxios from 'vue-axios'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import VueTheMask from 'vue-the-mask'

import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'https://kit.fontawesome.com/e223accf0a.js'
import 'https://code.jquery.com/jquery-3.5.1.slim.min.js'

const app = createApp(App)

app.use(VueTheMask)
app.use(router)
app.use(VueAxios, axios)

app.mount('#app')
