<template>
  <div class="tab">
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Назва</th>
        <th scope="col">Автор</th>
        <th scope="col">Мова</th>
        <th scope="col">К-сть сторінок</th>
        <th scope="col">Ціна</th>
        <th scope="col">Дія</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="book in books" :key="book.ID">
        <th scope="row">{{ book.ID }}</th>
        <td data-label="Назва"><input type="text" v-model="book.TITLE"/></td>
        <td data-label="Автор">{{ book.NAME }} {{ book.LASTNAME }}</td>
        <td data-label="Мова"><input type="text" v-model="book.LANGUAGE"/></td>
        <td data-label="К-сть сторінок"><input type="text" v-model="book.PAGE_AMOUNT"/></td>
        <td data-label="Ціна"><input type="text" v-model="book.PRICE"/></td>
        <td data-label="Дія" class="buttons">
          <button type="button" class="btn btn-primary"
                  @click="save(book.ID, book.TITLE, book.LANGUAGE, book.PAGE_AMOUNT, book.PRICE)">
            Зберегти
          </button>
          <button type="button" class="btn btn-danger" @click="del(book.ID)">
            Видалити
          </button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>


<script>
import axios from 'axios';

  export default {
      name: 'Books',
      data() {
        return {
          books: '',
          isAdmin: ''
        }
      },
    created() {
      axios.get(`http://localhost:8080/isAdmin`, { withCredentials: true })
          .then((response) => {this.isAdmin = response.data.isAdmin;})
          .catch((error) => {console.log(error)})

      axios.get(`http://localhost:8080/getBooks`, { withCredentials: true })
          .then((response) => {this.books = response.data.books;})
          .catch((error) => {console.log(error)})
    },
      methods: {
        save(bId, bTitle, bLanguage, bPageAmount, bPrice){
          axios.post(`http://localhost:8080/saveBook`,
              JSON.stringify({bId, bTitle, bLanguage,
                bPageAmount, bPrice}), { withCredentials: true }
          );


        },
        del(bookId){
          axios.post(`http://localhost:8080/deleteBook`,
              JSON.stringify({bookId}), { withCredentials: true }
          );
          this.$router.go('/BooksTable');

        }
      }
  }
//
// export default {
//     name: 'Books',
//     data() {
//         return{
//             books: '',
//             isAdmin: ''
//         }
//     },
//     created() {
//         axios.get(`http://localhost:8080/isAdmin`, { withCredentials: true })
//             .then((response) => {this.isAdmin = response.data.isAdmin;})
//             .catch((error) => {console.log(error)})
//
//         axios.get(`http://localhost:8080/getBooks`, { withCredentials: true })
//             .then((response) => {this.books = response.data.books;})
//             .catch((error) => {console.log(error)})
//     },
//     methods: {
//         save(bId, bTitle, bLanguage, bPageAmount, bPrice){
//             axios.post(`http://localhost:8080/saveBook`,
//                 JSON.stringify({bId, bTitle, bLanguage,
//                     bPageAmount, bPrice}), { withCredentials: true }
//             );
//
//
//         },
//         del(bookId){
//             axios.post(`http://localhost:8080/deleteBook`,
//                 JSON.stringify({bookId}), { withCredentials: true }
//             );
//             this.$router.go('/BooksTable');
//
//         }
//     }
// }

</script>

<style>
body {
  background-color: #f1f1f1;
  color: #333;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin: 0;
  padding: 0;
}

.table {
  width: 1400px;
  background-color: #fff;
  color: #333;
  border-collapse: collapse;
  margin-bottom: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  border-radius: 12px;
  overflow: hidden;
}

th, td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #343a40;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 16px;
}

tbody tr {
  transition: background-color 0.3s ease, transform 0.3s ease;
}

tbody tr:hover {
  background-color: #e9ecef;
  transform: translateY(-3px);
}

td input {
  width: 100%;
  padding: 8px 12px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 20px;
  font-size: 14px;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

td input:focus {
  border-color: #007bff;
  box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
}

.buttons {
  display: flex;
  gap: 10px;
  align-items: center;
  justify-content: center;
}

.btn {
  padding: 8px 16px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-primary {
  border-radius: 5px;
  background-color: black;
  color: #fff;
}

.btn-primary:hover{
  background-color: #565e64;
}

.btn-danger {
  border-radius: 5px;
  background-color: #dc3545;
  color: #fff;
}

.btn:hover {
  opacity: 0.9;
  transform: translateY(-2px);
}

.tab {
  display: flex;
  flex-wrap: wrap;
  align-content: center;
  flex-direction: column;
  max-width: 100%;
  margin: auto;
  padding: 20px;
}

@media (max-width: 1200px) {
  th, td {
    padding: 10px;
  }

  .table {
    width: 100%;
    font-size: 14px;
  }
}

@media (max-width: 480px) {
  .btn-primary{
    margin-left: 15px;
  }
  .table {
    width: 100%;
    font-size: 14px;
  }

  th,
  td {
    padding: 8px;
  }

  tbody tr {
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    display: block;
  }

  th {
    display: none;
  }

  td {
    display: block;
    text-align: right;
  }

  td:before {
    content: attr(data-label);
    float: left;
    font-weight: bold;
  }

  .buttons {
    display: block;
  }

  .btn-primary {
    margin-right: 15px;
  }

  td input {
    display: block;
    width: 100%;
    margin-bottom: 10px;
  }
}
</style>