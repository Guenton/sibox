export const state = () => ({
  dark: false
});

export const mutations = {
  swapTheme(state) {
    state.dark = !state.dark;
  }
};
