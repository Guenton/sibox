module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parserOptions: {
    parser: "babel-eslint"
  },
  extends: [
    "@nuxtjs",
    "plugin:nuxt/recommended",
    "plugin:prettier/recommended",
    "prettier",
    "prettier/vue"
  ],
  plugins: [
    "prettier",
    "vue"
  ],
  // add your custom rules here
  rules: {
    "nuxt/no-cjs-in-config": "off",
    "prettier/prettier": [
      "error", {
        "endOfLine": "auto",
        "printWidth": 100,
      }
    ],
    "no-console": "off",
    "no-restricted-syntax": [
      "error",  {
        "selector": "CallExpression[callee.object.name='console'][callee.property.name!=/^(log|warn|error|info|trace)$/]",
        "message": "Unexpected property on console object was called"
      }
    ]
  }
}