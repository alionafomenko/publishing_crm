<template>
  <div class="navbar-container">
    <img src="/src/assets/logo.png" alt="Logo" class="logo">
    <h1 class="header">Publishing World</h1>
    <ul class="nav nav-underline ul">
      <li class="nav-item">
        <a class="nav-link" id="main" href="/">Головна</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="registration" href="/Registration">Реєстрація</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="login" href="/Login">Вхід</a>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
      name: 'Navbar',
      props: {
        activePage: {
          type: String,
          required: true,
        }
      },
      mounted() {
        const activePage = document.getElementById(this.activePage);
        if (activePage) {
          const id = document.getElementById('main');
          const registration = document.getElementById('registration');
          const login = document.getElementById('login');
          id.className = 'nav-link';
          registration.className = 'nav-link';
          login.className = 'nav-link';
          activePage.classList.add('active');
        } else {
          console.error(`Element with ID ${this.activePage} not found.`);
        }
      }
  }
</script>

<style>
.navbar-container {
  text-align: center;
  margin-bottom: 20px;
  margin-top: 0;
  position: relative;
  top: 0;
  left: 0;
  right: 0;
  background-color: #fff;
  padding: 10px 0;
}

.logo {
  width: 160px;
  height: auto;
  display: block;
  margin: 0 auto 10px auto;
}

.header {
  font-size: 28px;
  color: #333;
  margin-top: 0;
  margin-bottom: 20px;
  text-transform: uppercase;
  font-family: 'Arial', sans-serif;
}

.ul {
  display: flex;
  justify-content: center;
  padding: 0;
  list-style: none;
  margin-bottom: 0;
}

.nav-item a {
  color: #383838;
  text-decoration: none;
  margin: 0 15px;
  font-size: 18px;
  font-family: 'Arial', sans-serif;
  padding: 15px 30px;
  transition: color 0.3s ease, background-color 0.3s ease;
  border-radius: 5px;
  min-width: 150px;
  text-align: center;
}

.nav-item a.active {
  color: #fff;
  background-color: #D3D3D3;
}

.nav-item a:hover {
  color: #483D8B;
  background-color: #DCDCDC;
}

@media (max-width: 768px) {
  .nav-item a {
    font-size: 16px;
    margin: 0 10px;
    padding: 12px 25px;
    min-width: 130px;
  }

  .header {
    font-size: 24px;
  }
}

@media (max-width: 576px) {
    .ul {
      flex-direction: column;
      align-items: center;
    }

    .nav-item a {
      font-size: 14px;
      margin: 10px 0;
      padding: 10px 20px;
    }

    .header {
      font-size: 20px;
    }

    .logo {
      width: 100px;
    }
}
</style>
