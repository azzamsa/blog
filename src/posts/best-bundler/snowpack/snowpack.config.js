module.exports = {
  mount: {
    "eleventy": "/",
    "src/styles": { url: "/styles" },
    "src/scripts": { url: "/scripts" },
    "src/fonts": { url: "/fonts" },
    "src/images": { url: "/images" },
  },
  alias: {
    '@modules': './src/scripts/modules',
    '@utilities': './src/scripts/utilities',
  },
  plugins: [
    "@snowpack/plugin-sass",
    "@snowpack/plugin-postcss",
    [
      "@snowpack/plugin-run-script",
      {
        cmd: "eleventy",
        watch: "$1 --watch",
      },
    ],
  ],
  devOptions: {
    open: 'none',
    // Eleventy updates multiple files at once, so add a delay before we trigger file watching
    // hmrDelay: 5000,
  },
  optimize: {
    bundle: true,
    minify: true,
    target: 'es2020',
  },
  buildOptions: {
    clean: true,
    out: 'dist',
  },
}
