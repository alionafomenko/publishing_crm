<template>
    <div class="mb-3">
        <label class="form-label">Назва книги</label>
        <input type="text" class="form-control" id="title"
               v-model="book.title">
    </div>
    <div class="mb-3">
        <label  class="form-label">Анотація</label>
        <textarea class="form-control" id="annotation" rows="3" maxlength="1000"
                  v-model="book.annotation" v-on:input="maxSymbols"></textarea>
    </div>
    <div class="amount-symbols">
        <p>{{amount}}/1000</p>
    </div>
    <button type="button" class="btn btn-primary"
            v-on:click="sendApplication">Відправити
    </button>
</template>

<script>
    import axios from "axios";

    export default {
        name: 'NewApp',
        data(){
            return{
                book:{
                    title: '',
                    annotation: ''
                },
                amount: ''


            }
        },
        methods: {
            sendApplication(){
                axios.post(`http://localhost:8080/sendApplication`,
                    JSON.stringify(this.book), { withCredentials: true })
                this.$router.push("/NewApplication");
                this.book.title = '';
                this.book.annotation = '';

            },
            maxSymbols(){
                const annotation = document.getElementById('annotation').value;
                this.amount = annotation.length;

            }

        }
    }

</script>

<style>
body {
  background-color: #f4f4f4;
  font-family: Arial, sans-serif;
}
.mb-3 {
  width: 100%;
  max-width: 600px;
  margin: 0 auto;
}

.form-label {
  font-weight: bold;
  color: #333;
  font-size: 16px;
}

.form-control {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 2px solid #ddd;
  border-radius: 8px;
  transition: border-color 0.3s, box-shadow 0.3s;
}

.form-control:focus {
  border-color: #007bff;
  box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
}

.amount-symbols {
  display: flex;
  justify-content: flex-end;
  margin-right: 300px;
  font-size: 14px;
  color: #555;
}

.btn-primary {
  background-color: black;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  padding: 10px 20px;
  border: none;
  border-radius: 8px;
  transition: background-color 0.3s, transform 0.3s;
  cursor: pointer;
  display: block;
  margin: 20px auto;
}

.btn-primary:hover {
  background-color: #565e64;
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .mb-3 {
    width: 90%;
  }

  .btn-primary {
    width: 100%;
  }
}

@media (max-width: 480px) {
  .form-label {
    font-size: 14px;
  }

  .form-control {
    padding: 8px;
    font-size: 14px;
  }

  .btn-primary {
    width: 330px;
    font-size: 14px;
    padding: 8px 16px;
  }
}
</style>