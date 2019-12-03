<template>
  <v-responsive>
    <img v-if="dark" class="KLPure" alt="Kompa Leon" src="~/static/KLPure-W.png" />
    <img v-if="!dark" class="KLPure" alt="Kompa Leon" src="~/static/KLPure-ID3.png" />
  </v-responsive>
</template>

<script>
export default {
  computed: {
    dark() {
      return this.$store.state.dark;
    }
  }
};
</script>

<style>
.KLPure {
  width: 240px;
  transform: rotateY(560deg);
  animation: turn 3.5s ease-out forwards 1s;
}

@keyframes turn {
  100% {
    transform: rotateY(0deg);
  }
}
</style>
