<template>
  <v-app id="default">
    <v-navigation-drawer v-model="drawer" :mini-variant="miniVariant" :clipped="clipped" fixed app>
      <v-list>
        <v-list-item v-for="(item, i) in items" :key="i" :to="item.to" router exact>
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar :clipped-left="clipped" fixed app color="primary">
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-application</v-icon>
      </v-btn>
      <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? "right" : "left"}` }}</v-icon>
      </v-btn>
      <v-toolbar-title v-text="title" />
      <v-spacer />

      <v-tooltip bottom>
        <template v-slot:activator="{ on }">
          <v-btn icon v-on="on" @click.stop="swapTheme()">
            <v-icon>{{ flashButton }}</v-icon>
          </v-btn>
        </template>
        <span>Toggle Nightmode</span>
      </v-tooltip>
    </v-app-bar>

    <v-content>
      <v-container>
        <nuxt />
      </v-container>
    </v-content>

    <v-footer fixed app color="primary">
      <span>&copy; 2019 Maduro & Curiel's Bank N.V.</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      dark: false,
      clipped: false,
      drawer: false,
      items: [
        {
          icon: "mdi-apps",
          title: "Home",
          to: "/home"
        },
        {
          icon: "mdi-account",
          title: "People",
          to: "/emp"
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: "SIBOX"
    };
  },
  computed: {
    flashButton() {
      return this.$store.state.dark ? "mdi-hexagon-outline" : "mdi-hexagon-slice-6";
    }
  },
  methods: {
    swapTheme() {
      this.$store.commit("swapTheme");
      this.$vuetify.theme.dark = this.$store.state.dark;
    }
  }
};
</script>
