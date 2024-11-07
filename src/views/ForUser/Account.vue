<template>
  <div class="container">
    <Navbar :active-page_2="activePage_2"></Navbar>
    <div class="content">
    <UserAcc></UserAcc>
    </div>
  </div>
</template>

<script>
    import Navbar from '../../components/Navbars/UserNavbar.vue'
    import UserAcc from '../../components/Accounts/UserAcc.vue'

    export default {
        name: 'Account',
        components: {
            Navbar,
            UserAcc
        },
        data(){
            return{
                activePage_2: 'account'
            }
        }

    }
</script>

<style>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}
</style>