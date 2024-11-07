<template>
  <div class="user-profile">
    <h2 class="text-center">Вітаємо на персональній сторінці читача!</h2>
    <div v-for="user in users" :key="user.ID" class="user-card">
      <div class="user-detail">
        <p><strong>Ім'я:</strong> {{ user.NAME }}</p>
        <p><strong>Прізвище:</strong> {{ user.LASTNAME }}</p>
        <p><strong>Номер телефону:</strong> {{ user.PHONE }}</p>
        <p><strong>Пошта:</strong> {{ user.EMAIL }}</p>
      </div>
    </div>
  </div>
  <button type="button" class="btn btn-primary" v-on:click="logout">Вийти</button>
  <div class="user-profile">
    <h3 class="text-center">Мої замовлення</h3>
    <div class="shadow div p-3 mb-5 bg-body-tertiary rounded" v-for="book in orders" :key="book.ID">
      <div class="title">
        <div class="img text-center">
          <img :src="book.IMAGE" alt="Обкладинка книги"/>
        </div>
        <div>
          <p>Назва: {{ book.TITLE }}</p>
          <p>Автор: {{ book.NAME }} {{ book.LASTNAME }}</p>
          <p>Мова: {{ book.LANGUAGE }}</p>
          <p>К-сть сторінок: {{ book.PAGE_AMOUNT }}</p>
        </div>
      </div>
      <div>
        <p class="price">{{ book.PRICE }}.00 грн</p>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
    name: 'UserAcc',
    data() {
        return {
          users: '',
          orders:''
        }
    },
    created() {
          axios.get(`http://localhost:8080/getAllUserInf`, { withCredentials:
                   true })
              .then((response) => {this.users = response.data.user;
                                   console.log('///////////',response.data.user);
                                   this.orders = response.data.order})
              .catch((error) => {console.log(error)})
    },
    methods: {
      logout(){
             axios.post(`http://localhost:8080/logout`,'',{ withCredentials:
                     true })
                .catch((error) => {console.log(error)})
             this.$router.push("/");
         }
    }

};

// export default {
//     name: 'UserAcc',
//     data(){
//         return{
//             user: '',
//             order: ''
//         }
//     },
//     created() {
//         axios.get(`http://localhost:8080/getAllUserInf`, { withCredentials:
//                 true })
//             .then((response) => {this.user = response.data.user;
//                                 console.log(response.data.user);
//                                  this.order = response.data.order})
//             .catch((error) => {console.log(error)})
//     },
//     methods:{
//         logout(){
//             axios.post(`http://localhost:8080/logout`,'',{ withCredentials:
//                     true })
//                 .catch((error) => {console.log(error)})
//             this.$router.push("/");
//         }
//
//     }
// }

</script>
<style>
body {
  background-color: #f1f1f1;
  font-family: Arial, sans-serif;
}

.user-profile {
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

.user-card {
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 35px;
  margin-bottom: 20px;
  border-radius: 6px;
}

.user-detail p {
  margin: 5px 0;
}

.user-detail strong {
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

.img {
  width: 100px;
  height: 160px;
  margin-right: 20px;
  background-color: #EBEBEB;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.title {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
}

.title {
  color: #000;
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
  .user-profile {
    width: 100%;
    padding: 15px;
  }

  .user-card {
    padding: 20px;
  }
}

@media (max-width: 992px) {
  .user-profile {
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

  .img {
    width: 80px;
    height: 120px;
    margin-bottom: 10px;
  }
}

@media (max-width: 768px) {
  .user-profile {
    padding: 5px;
  }

  h2, h3 {
    font-size: 24px;
  }

  .btn {
    width: 100%;
  }

  .user-card {
    padding: 15px;
  }

  .shadow.div {
    padding: 10px;
  }

  .img {
    width: 130px;
    height: 180px;
  }

  .title {
    justify-content: space-between;
    width: 100%;
  }

  .title p {
    font-size: 14px;
  }

  .price {
    font-size: 16px;
    color: #000;
    align-self: flex-end;
  }
}

@media (max-width: 576px) {
  .user-profile {
    padding: 5px;
  }

  h2, h3 {
    font-size: 20px;
  }

  .btn {
    padding: 12px;
    font-size: 14px;
  }

  .user-card {
    padding: 10px;
  }

  .shadow.div {
    padding: 8px;
  }

  .img {
    width: 130px;
    height: 180px;
  }

  .title {
    flex-direction: column;
  }

  .title p {
    font-size: 12px;
  }

  .price {
    font-size: 14px;
    color: #000;
    margin-top: 10px;
    text-align: left;
  }
}
</style>