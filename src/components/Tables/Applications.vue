<template>
  <div class="tab">
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Автор</th>
        <th scope="col">Назва книги</th>
        <th scope="col">Статус</th>
        <th scope="col">Дія</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="application in applications" :key="application.ID" class="table-row">
        <th scope="row" data-label="ID">{{ application.ID }}</th>
        <td data-label="Автор">{{ application.NAME }} {{ application.LASTNAME }}</td>
        <td data-label="Назва книги">{{ application.BOOK_TITLE }}</td>
        <td data-label="Статус">
          <select class="form-select" v-model="application.STATUS" data-label="Статус">
            <option value="НОВА">НОВА</option>
            <option value="ВІДХИЛЕНА">ВІДХИЛЕНА</option>
            <option value="ПРИЙНЯТА">ПРИЙНЯТА</option>
            <option value="ОПУБЛІКОВАНА">ОПУБЛІКОВАНА</option>
          </select>
        </td>
        <td data-label="Дія" class="buttons">
          <button v-on:click="save(application.ID, application.STATUS)" class="btn btn-primary">
            Зберегти
          </button>
          <button v-if="application.STATUS === 'ПРИЙНЯТА'" v-on:click="addBook(application.ID)" class="btn btn-success">
            Додати у каталог
          </button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>

import axios from "axios";

  export default {
      name: 'Applications',
      data() {
        return {
          applications: ''
        }
      },
      created() {
         axios.get(`http://localhost:8080/getApplications`, { withCredentials: true })
             .then((response) => {
               this.applications = response.data.applications;
             })
             .catch((error) => {
               console.log(error);
             });
      },
      methods: {
        save(id, status) {
          axios.post(`http://localhost:8080/saveStatus`,
              JSON.stringify({id, status}), {withCredentials: true}
          );

        },
        addBook(appId){
          console.log('meth add')
          axios.post(`http://localhost:8080/addBook`,
              JSON.stringify({appId}), {withCredentials: true}
          );
          this.$router.go('/ApplicationsTable');
        }

      }
  }

// import axios from 'axios';
//
// export default {
//   name: 'Applications',
//   data() {
//     return {
//       applications: '',
//     };
//   },
//   created() {
//     axios.get(`http://localhost:8080/getApplications`, { withCredentials: true })
//         .then((response) => {
//           this.applications = response.data.applications;
//         })
//         .catch((error) => {
//           console.log(error);
//         });
//   },
//   methods: {
//     save(id, status) {
//       axios.post(`http://localhost:8080/saveStatus`,
//           JSON.stringify({ id, status }), { withCredentials: true }
//       );
//     },
//     addBook(appId) {
//       axios.post(`http://localhost:8080/addBook`,
//           JSON.stringify({ appId }), { withCredentials: true }
//       );
//       this.$router.go('/ApplicationsTable');
//     }
//   }
// };
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

th,
td {
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

.btn-success {
  border-radius: 5px;
  background-color: #28a745;
  color: #fff;
}
.btn-primary:hover{
  background-color: #565e64;
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
  max-width: 900px;
  margin: auto;
  padding: 20px;
}

@media (max-width: 768px) {
  .tab {
    padding: 10px;
  }

  th,
  td {
    padding: 10px;
  }

  .buttons {
    flex-direction: column;
    gap: 5px;
  }

  .btn {
    width: 100%;
  }
}

@media (max-width: 480px) {
  .table {
    width: 335px;
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

  td:before {
    content: attr(data-label);
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
  }
}
</style>