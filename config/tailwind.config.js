const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    colors: {
      "mainColor": "#2c3639",
      "white": "#ffffff",
      "black": "#000000",
      "signIn": "#9ff1e5",
      "signUp": "#ecffc8",
      "fontColor": "#0c5d75",
      "footerGray": "#f5f5f5",
      "editIcon": "#047487",
      "removeIcon": "#920404",
      "evaluationStrong": "#126f05",
      "evaluationLight": "#ddffd9",
      "chapterStrong": "#05636f",
      "surveyStrong": "#686f05",
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
