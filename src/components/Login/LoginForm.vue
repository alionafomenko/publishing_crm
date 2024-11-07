<template>
  <p class="description">Виберіть свій статус, щоб продовжити:</p>
  <div class="t">
        <table class="table table-hover">
            <tbody>
            <tr >
                <td class="text-center">
                    <a href="/UserLog"><i class="fa-solid fa-user"></i> Я читач</a></td>
            </tr>
            <tr>
                <td class="text-center">
                    <a href="/AuthorLog"><i class="fa-solid fa-pen-nib"></i>  Я письменник</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import 'https://kit.fontawesome.com/e223accf0a.js'
    export default {
        name: 'LoginForm'
    }
</script>


<style>
body {
  height: 100vh;
  background: linear-gradient(135deg, #ffffff, #d1d1e0);
  font-family: 'Arial', sans-serif;
}

.description {
  margin-top: 50px;
  text-align: center;
  font-size: 20px;
  color: #555;
}

.t {
  display: flex;
  justify-content: center;
  padding: 20px;
}

.table {
  width: 100%;
  max-width: 400px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 3px rgba(0, 0, 0, 0.2);
  border-collapse: collapse;
  overflow: hidden;
}

.table-hover tbody tr:hover {
  background-color: #f5f5f5;
}

.text-center {
  text-align: center;
  padding: 20px;
}

.text-center a {
  text-decoration: none;
  color: #333;
  font-size: 18px;
  padding: 10px 15px;
  display: inline-block;
  background-color: #f8f9fa;
  border-radius: 5px;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.text-center a:hover {
  background-color: #595959 ;
  color: #fff;
  transform: translateY(-2px);
}

@media (max-width: 600px) {
  .text-center a {
    font-size: 16px;
    padding: 8px 12px;
  }

  .table {
    width: 90%;
  }
}

@media (max-width: 400px) {
  .description{
    font-size: 16px;
  }
  .text-center a {
    font-size: 14px;
    padding: 6px 10px;
  }
}

</style>