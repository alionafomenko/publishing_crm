<template>
    <Navbar :active-page="activePage"/>
    <div class="f">
        <div class="form">
          <h1 class="main-header">Введіть свої дані читача:</h1>
            <form v-on:submit.prevent="logUser">
                <div class="form-floating">
                    <input type="email" class="form-control" id="email"
                           placeholder="Електронна пошта" required
                           v-model="user.email" >
                    <label for="email">Електронна пошта</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="password"
                           placeholder="Пароль" required
                           v-model="user.password" >
                    <label for="password">Пароль</label>
                </div>
                <div class="button">
                    <button type="submit"
                            class="btn btn-primary" value="Save"> Увійти
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>

    import Navbar from "../Main/NavbarMain.vue"
    import axios from 'axios';

    export default {
        name: 'UserLog',
        components: {
            Navbar

        },
        data(){
            return{
                user: {
                    email: '',
                    password: '',
                },
                activePage: 'login'
            }
        },
        methods: {
            async logUser() {
                console.log("method log User")
               const res = await axios.post(`http://localhost:8080/loginUser`,
                   JSON.stringify(this.user),
                   { withCredentials: true }
               )
                const login_data = await res.data.error;
                if (login_data === 'nouser'){
                    this.$router.push("/UserLog");
                    const passwordDiv = document.getElementById('password')
                    const emailDiv = document.getElementById('email')
                    passwordDiv.className = 'form-control is-invalid';
                    emailDiv.className = 'form-control is-invalid';
                } else if ( login_data === 'invalidpassword'){
                    const passwordDiv = document.getElementById('password')
                    const emailDiv = document.getElementById('email')
                    emailDiv.className = 'form-control ';
                    passwordDiv.className = 'form-control is-invalid';
                    this.$router.push("/UserLog");
                } else {
                    this.$router.push("/Account");
                }

            },

        }

    }

</script>

<style>
body {
  background-color: #f8f9fa;
  font-family: 'Arial', sans-serif;
}
.main-header {
  font-size: 24px;
  font-weight: bold;
  color: #333;
  text-align: center;
  margin-bottom: 20px;
  animation: fadeIn 1s;
}
.form {
  width: 90%;
  max-width: 400px;
  margin: auto;
  padding: 20px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  animation: slideIn 0.5s;
}

@keyframes slideIn {
  from {
    transform: translateY(20px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.form-floating {
  margin-bottom: 20px;
}

.form-control {
  border: 1px solid #000;
  background-color: #fff;
  color: #000;
}

.form-control.is-invalid {
  border-color: red;
}

.button {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.btn {
  background-color: #000;
  color: #fff;
  border: none;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn:hover {
  background-color: #444;
}

.invalid {
  color: red;
}

@media (max-width: 600px) {
  .form {
    width: 90%;
  }

  .btn {
    width: 100%;
  }
}

@media (max-width: 400px) {
  .form {
    padding: 15px;
  }

  .form-control {
    font-size: 14px;
  }

  .btn {
    font-size: 16px;
  }
}

.f {
  height: 70vh;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  align-content: center;
}
</style>