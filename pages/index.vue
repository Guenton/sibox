<template>
  <div class="container">
    <div>
      <KLogo />
      <h1 class="title">
        SIBOX
      </h1>
      <h2 class="subtitle">
        Statistical Report System
      </h2>
      <div class="links">
        <v-btn large color="primary" to="/home">
          Login
        </v-btn>
        <v-btn large color="accent" to="/docs">
          Documentation
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script>
import KLogo from "~/components/KLogo.vue";

export default {
  layout: "splash",
  components: {
    KLogo
  }
};
</script>

<style scoped>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
