<template>
  <div class="author-profile">
    <h2 class="text-center">Вітаємо на персональній сторінці автора!</h2>
    <div v-for="author in author" :key="author.ID" class="author-card">
      <div class="author-details">
        <p><strong>Ім'я:</strong> {{ author.NAME }}</p>
        <p><strong>Прізвище:</strong> {{ author.LASTNAME }}</p>
        <p><strong>Номер телефону:</strong> {{ author.PHONE }}</p>
        <p><strong>Пошта:</strong> {{ author.EMAIL }}</p>
      </div>
    </div>
  </div>
  <button type="button" class="btn btn-primary" v-on:click="logout">Вийти</button>
  <div class="author-profile">
    <h3 class="text-center">Мої заявки</h3>
    <div  class="shadow div p-3 mb-5 bg-body-tertiary rounded" v-for="application in application" :key="application.ID">
      <div class="application-card">
        <div class="book-title">{{ application.BOOK_TITLE }}</div>
        <div class="status-label" :class="statusClass(application.STATUS)">
          {{ application.STATUS }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'AuthorAcc',
  data() {
    return {
      author: '',
      application: ''
    }
  },
  created() {
    axios.get(`http://localhost:8080/getAllAuthorInf`, { withCredentials:
          true })
        .then((response) => {this.author = response.data.author;
          this.application = response.data.application})
        .catch((error) => {console.log(error)})
  },
  methods: {
    statusClass(status) {
      if (status === 'Прийнята') {
        return 'accepted';
      } else if (status === 'Очікує на підтвердження') {
        return 'pending';
      } else if (status === 'Відхилена') {
        return 'rejected';
      }
    },
    logout(){
      axios.post(`http://localhost:8080/logout`,'',{ withCredentials:
            true })
          .catch((error) => {console.log(error)})
      this.$router.push("/");
    }
  }
}
// import axios from "axios";
//
//     export default {
//         name: 'AuthorAcc',
//         data(){
//             return{
//                 author: '',
//                 application: ''
//             }
//         },
//         created() {
//             axios.get(`http://localhost:8080/getAllAuthorInf`, { withCredentials:
//                     true })
//                 .then((response) => {this.author = response.data.author;
//                     this.application = response.data.application})
//                 .catch((error) => {console.log(error)})
//         },
//         methods:{
//             logout(){
//                 axios.post(`http://localhost:8080/logout`,'',{ withCredentials:
//                         true })
//                     .catch((error) => {console.log(error)})
//                 this.$router.push("/");
//             }
//
//         }
//     }
</script>

<style>
body {
  background-color: #f1f1f1;
  font-family: Arial, sans-serif;
}

.author-profile {
  background-color: #f5f5f5;
  color: #000;
  font-family: Arial, sans-serif;
  padding: 20px;
  border-radius: 8px;
  width: 1200px;
  margin: 0 auto;
}

h2, h3 {
  color: #333;
}

.text-center {
  padding: 10px;
  font-family: -apple-system, sans-serif;
  text-align: center;
}

.author-card {
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 35px;
  margin-bottom: 20px;
  border-radius: 6px;
}

.author-details p {
  margin: 5px 0;
}

.author-details strong {
  color: black;
}

.btn {
  background-color: #000;
  color: #fff;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  display: block;
  width: 100%;
  max-width: 200px;
  margin: 20px auto;
}

.btn:hover {
  background-color: #333;
}

.shadow.div {
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 15px;
  margin-bottom: 20px;
  border-radius: 6px;
}

.book-title {
  font-size: 18px;
  font-weight: bold;
  color: #333;
}

.status-label {
  padding: 5px 10px;
  border-radius: 15px;
  font-size: 14px;
  font-weight: 600;
}

.accepted {
  background-color: #28a745;
  color: #fff;
}

.pending {
  background-color: #ffc107;
  color: #fff;
}

.rejected {
  background-color: #dc3545;
  color: #fff;
}

.title p {
  margin: 5px 0;
}

.div {
  display: flex;
  justify-content: space-between;
  border-top: 1px solid #ccc;
  padding-top: 15px;
}

.div p {
  color: #000;
}

@media (max-width: 1200px) {
  .author-profile {
    width: 100%;
    padding: 15px;
  }

  .author-card {
    padding: 20px;
  }
}

@media (max-width: 992px) {
  .author-profile {
    padding: 10px;
  }

  .div {
    flex-direction: column;
    align-items: flex-start;
  }

  .title {
    flex-direction: column;
    align-items: flex-start;
  }
}

@media (max-width: 768px) {
  .author-profile {
    padding: 5px;
  }

  h2, h3 {
    font-size: 24px;
  }

  .btn {
    width: 100%;
  }

  .author-card {
    padding: 15px;
  }

  .shadow.div {
    padding: 10px;
  }
}

@media (max-width: 576px) {
  .author-profile {
    padding: 5px;
  }

  h2, h3 {
    font-size: 20px;
  }

  .btn {
    padding: 12px;
    font-size: 14px;
  }

  .author-card {
    padding: 10px;
  }

  .shadow.div {
    padding: 8px;
  }

  .title {
    flex-direction: column;
  }

  .title p {
    font-size: 12px;
  }
}
</style>