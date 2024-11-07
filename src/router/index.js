import { createRouter, createWebHistory } from 'vue-router'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import ('../views/Home.vue') //це є
    },

    {
      path: '/BooksCatalog',
      name: 'BooksCatalog',
      component: () => import('../views/ForUser/BooksCatalog.vue')//це є
    },
    {
      path: '/Registration',
      name: 'Registration',
      component: () => import('../views/Registration.vue')//це є
    },
    {
      path: '/UserForm',
      name: 'UserForm',
      component: () => import('../components/Registration/UserForm.vue')//це є
    },
    {
      path: '/AuthorForm',
      name: 'AuthorForm',
      component: () => import('../components/Registration/AuthorForm.vue')//це є
    },
    {
      path: '/Login',
      name: 'Login',
      component: () => import('../views/Login.vue')//це є
    },
    {
      path: '/UserLog',
      name: 'UserLog',
      component: () => import('../components/Login/UserLog.vue')//це є
    },
    {
      path: '/AuthorLog',
      name: 'AuthorLog',
      component: () => import('../components/Login/AuthorLog.vue')//це є
    },
    {
      path: '/Account',
      name: 'Account',
      component: () => import('../views/ForUser/Account.vue')//це є
    },
    {
      path: '/AccountAuthor',
      name: 'AccountAuthor',
      component: () => import('../views/ForAuthor/Account.vue')
    },
    {
      path: '/NewApplication',
      name: 'NewApplication',
      component: () => import('../views/ForAuthor/NewApplication.vue')//це є
    },
    {
      path: '/Admin',
      name: 'Admin',
      component: () => import('../views/ForAdmin/AdminLog.vue')
    },
    {
      path: '/UsersTable',
      name: 'UsersTable',
      component: () => import('../views/ForAdmin/AdminTables/UsersTable.vue')//це є
    },
    {
      path: '/AuthorsTable',
      name: 'AuthorsTable',
      component: () => import('../views/ForAdmin/AdminTables/AuthorsTable.vue')//це є
    },
    {
      path: '/OrdersTable',
      name: 'OrdersTable',
      component: () => import('../views/ForAdmin/AdminTables/OrdersTable.vue')//це є
    },
    {
      path: '/BooksTable',
      name: 'BooksTable',
      component: () => import('../views/ForAdmin/AdminTables/BooksTable.vue')//це є
    },
    {
      path: '/ApplicationsTable',
      name: 'ApplicationsTable',
      component: () => import('../views/ForAdmin/AdminTables/ApplicationsTable.vue')//це є
    },


  ]
})

export default router