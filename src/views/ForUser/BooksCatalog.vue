<template>
  <div class="container">
    <Navbar :active-page_2="activePage_2"></Navbar>
    <Books />
  </div>
</template>

<script>
    import Navbar from '../../components/Navbars/UserNavbar.vue'
    import Books from "../../components/BooksCatalog/Books.vue";

    export default {
        name: 'BooksCatalog',
        components: {
            Navbar,
            Books
        },
        data(){
            return{
                activePage_2: 'bookCatalog',
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