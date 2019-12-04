<template>
  <v-layout>
    <v-flex class="text-center">
      <blockquote class="blockquote">
        &#8220;Wie niet dom is moet slim zijn.&#8221;
        <footer>
          <small>
            <em>&mdash; Marlon C. G. Richardson</em>
          </small>
        </footer>
      </blockquote>
      <h1>{{ api }}</h1>
      <h1>{{ env }}</h1>
      <h1>{{ test }}</h1>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
      api: process.env.API_URL,
      env: process.env.APP_ENV,
      test: process.env.TEST_SHIZNIT || "Test Shiznit not found so using Default"
    };
  }
};
</script>
