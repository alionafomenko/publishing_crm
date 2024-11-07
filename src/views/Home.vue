<template>
  <Navbar :active-page="activePage"></Navbar>

  <div class="content">
    <h2 class="section-header">Для користувачів</h2>
    <p class="text">Якщо ви звичайний користувач і хочите замовити предпродаж книги<br/> - зробіть вхід або
      зареєструйтеся як читач</p>

    <h2 class="section-header">Для авторів</h2>
    <p class="text">Якщо ви автор і хочите залишити заявку видавництву на публікацію вашої книги<br/> - зробіть вхід
      або зареєструйтеся як письменник</p>
  </div>

  <div class="company-info">
    <h2 class="section-header">Про компанію</h2>
    <div class="descr">
      <p class="text-descr">Publishing World - це видавництво, яке надає можливість як авторам, так і читачам отримувати
        найкращі книги в світі. Ми спеціалізуємося на підтримці нових письменників і надаємо широкий асортимент
        літератури для читачів.<br><br>
        Наша місія полягає в тому, щоб зробити процес публікації легким, прозорим і доступним для всіх, хто
        має пристрасть до літератури. Ми пишаємося тим, що наші автори не тільки створюють унікальні твори,
        але й мають можливість донести їх до широкої аудиторії, яка цінує справжню літературну творчість.
        Кожна книга, яку ми публікуємо, проходить через ретельний процес редагування, коректури та дизайну,
        щоб забезпечити її високу якість. Наші читачі можуть бути впевнені, що отримують найкращі книги у своїх
        улюблених жанрах – від художньої літератури до наукових досліджень та біографій.
        Окрім публікації книг, ми також активно співпрацюємо з молодими письменниками, надаючи їм можливість
        розвивати свої таланти через наші спеціальні програми та літературні конкурси. Наша команда професіоналів
        завжди готова підтримати авторів на кожному етапі їхньої творчої подорожі.
        Підтримуючи різноманітність жанрів і стилів, Publishing World прагне розширювати межі літературного світу
        та створювати платформу для всіх, хто хоче поділитися своєю історією зі світом. Ми віримо, що кожен голос важливий, і кожна історія заслуговує на те, щоб бути почутою.</p>
      <img class="company-image" src="/src/photo/photo1.jpg" alt="Company Image">
    </div>
  </div>


  <Footer/>
</template>

<script>
import Navbar from '../components/Main/NavbarMain.vue'
import Footer from "@/components/Main/FooterMain.vue";

export default {
  name: 'Home',
  components: {
    Footer,
    Navbar
  },
  data() {
    return {
      activePage: 'main'
    }
  }
}
</script>

<style>
.content {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-image: url("https://i.pinimg.com/564x/47/d5/42/47d5423932d44655c217832b0d0257ef.jpg");
  background-size: auto;
  background-attachment: fixed;
  color: #fff;
  height: 100vh;
}

.company-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100%;
  padding: 40px;
  background-color: white;
  color: black;
  text-align: center;
}

.descr {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 20px;
}

.company-image {
  width: 350px;
}

.section-header {
  margin-top: 20px;
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 20px;
  text-transform: uppercase;
}

.text {
  font-size: 20px;
  line-height: 1.6;
  margin-bottom: 40px;
  padding: 0 20px;
  text-align: center;
}

.text-descr{
  font-size: 20px;
  line-height: 1.6;
  margin-bottom: 40px;
  padding: 0 20px;
  text-align: left;
}

@media (max-width: 768px) {
  .company-info{
    height: 2500px;
  }
  .descr{
    flex-direction: column;
  }

  .content{
    padding: 20px;
  }

  .company-info{
    padding: 20px;
  }

  .section-header {
    font-size:  5vw;
  }

  .text {
    font-size:  4vw;
    margin-bottom: 30px;
  }

  .text-descr {
      font-size: 4vw;
      margin-bottom: 30px;
  }
}

@media (max-width: 576px) {
  .descr{
    flex-direction: column;
  }
  .content{
    padding: 20px;
  }

  .section-header {
    font-size:  5vw;
  }

  .text {
    font-size:  5vw;
  }
  .text-descr {
    font-size: 5vw;
  }
 .company-image{
   width: 250px;
 }

 .company-info{
   height: 2200px;
 }
}
</style>