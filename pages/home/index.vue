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
      <h1>{{ error }}</h1>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  auth: true,
  data() {
    return {
      api: process.env.api || "Api not found so using Default",
      env: process.env.env || "Env not found so using Default",
      error: ""
    };
  },
  async mounted() {
    // const token = this.$auth.$state;
    const url = `http://localhost:3000/auth/test`;
    try {
      const response = await this.$axios.$get(url);
      if (response.err) {
        this.error = response.err;
      } else {
        this.error = response.data;
      }
    } catch (error) {
      this.error = error;
    }
  }
};
</script>
