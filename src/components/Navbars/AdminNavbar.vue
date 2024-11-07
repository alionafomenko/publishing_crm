<template>
  <div>
    <img src="/src/assets/logoNavbar.png" alt="Logo" class="logo">
    <h1 class="header">Publishing World</h1>
    <ul class="nav nav-underline ul">
      <li class="nav-item">
        <a class="nav-link" id="users" href="/UsersTable">Користувачі</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="authors" href="/AuthorsTable">Автори</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="books" href="/BooksTable">Книги</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="orders" href="/OrdersTable">Замовлення</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="applications" href="/ApplicationsTable">Заявки</a>
      </li>
      <li class="nav-item button">
        <button type="button" class="btn btn-primary" v-on:click="logout">Вийти</button>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'NavbarAdmin',
  props: {
    activePage: {
      type: String,
      required: true,
    },
  },
  mounted() {
    const activePage = document.getElementById(this.activePage);
    if (activePage) {
      activePage.classList.add('active');
    } else {
      console.error(`Element with ID ${this.activePage} not found.`);
    }
  },
  methods: {
    logout() {
      axios.post(`http://localhost:8080/logout`, '', {withCredentials: true})
          .catch((error) => {
            console.log(error);
          });
      this.$router.push("/Admin");
    }
  }
};
</script>

<style>
body {
  background-color: #f8f9fa;
  color: #000;
  font-family: Arial, sans-serif;
}

.logo {
  width: 160px;
  height: auto;
  display: block;
  margin: 0 auto 10px auto;
}

.header {
  color: #000;
  text-align: center;
  font-size: 36px;
  margin-bottom: 30px;
  font-weight: bold;
}

.ul {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-bottom: 20px;
  list-style-type: none;
}

.nav-link {
  color: #000;
  text-decoration: none;
  padding: 10px 20px;
  font-size: 20px;
  transition: color 0.3s ease, background-color 0.3s ease;
  border-radius: 5px;
}

.btn-primary {
  background-color: #000;
  color: #fff;
  border: 1px solid #000;
  padding: 12px 24px;
  font-size: 20px;
}

.button {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

@media (max-width: 768px) {
  .ul {
    flex-direction: column;
    align-items: center;
  }

  .nav-link {
    font-size: 18px;
    padding: 8px 16px;
  }

  .header {
    font-size: 30px;
  }
}

@media (max-width: 576px) {
  .ul {
    flex-direction: column;
    align-items: center;
  }

  .nav-link {
    font-size: 16px;
    padding: 6px 12px;
  }

  .btn-primary {
    font-size: 18px;
    padding: 10px 20px;
  }

  .header {
    font-size: 24px;
    padding-top: 30px;
    margin-bottom: 20px;
  }
}
</style>
