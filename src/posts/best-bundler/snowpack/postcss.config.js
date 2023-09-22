const purgecss = require("@fullhuman/postcss-purgecss")
const cssnano = require("cssnano")

module.exports = (ctx) => {
  console.log(">>> postcss ctx.env: " + ctx.env)
  return {
    plugins: [
      require("tailwindcss")("./tailwind.config.js"),
      ctx.env === "production" ? require("autoprefixer") : null,
      ctx.env === "production" ? cssnano({ preset: "default" }) : null,
      ctx.env === "production"
        ? purgecss({
            content: ["src/**/*.njk", "src/**/*.scss"],
            defaultExtractor: (content) => content.match(/[\w-/:]+(?<!:)/g) || [],
          })
        : null,
    ],
  }
}
