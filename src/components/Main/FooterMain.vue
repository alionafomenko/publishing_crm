<template>
  <footer class="footer-container">
    <div class="footer-content">
      <p>&copy; {{ currentYear }} Publishing World. All rights reserved.</p>
      <ul class="social-links">
        <li>
          <a href="https://facebook.com" target="_blank" rel="noopener noreferrer">
            <i class="fa-brands fa-facebook" style="color: #1100ff;"></i>Facebook</a>
        </li>
        <li>
          <a href="https://twitter.com" target="_blank" rel="noopener noreferrer"><i class="fa-brands fa-twitter" style="color: #178de8;"></i>
            Twitter</a>
        </li>
        <li>
          <a href="https://instagram.com" target="_blank" rel="noopener noreferrer">
            <i class="fa-brands fa-instagram"></i> Instagram
          </a>
        </li>
      </ul>
    </div>
  </footer>
</template>

<script>

export default {
  name: 'Footer',
  data() {
    return {
      currentYear: new Date().getFullYear(),
    };
  }
}
</script>

<style>
.footer-container {
  text-align: center;
  padding: 20px 0;
  background-color: #f8f8f8;
  border-top: 1px solid #eaeaea;
  margin-bottom: 0;
  position: relative;
}

.footer-content {
  max-width: 800px;
  margin: 0 auto;
}

.footer-content p {
  margin: 10px 0;
  color: #333;
}

.social-links {
  list-style: none;
  padding: 0;
  margin: 10px 0;
}

.social-links li {
  display: inline;
  margin: 0 15px;
}

.social-links a {
  color: #383838;
  text-decoration: none;
  transition: color 0.3s ease;
}

.social-links a:hover {
  background-color: white;
  color: #483D8B;
}

.social-links a i {
  margin-right: 5px; /* Adds space between icon and text */
}

@media (max-width: 576px) {
  .social-links li {
    margin: 0 10px;
  }
}
</style>
