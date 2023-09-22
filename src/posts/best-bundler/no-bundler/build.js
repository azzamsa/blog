#!/usr/bin/env node
const { build } = require("esbuild")

let onResolvePlugin = {
  name: "resolvePath",
  setup(build) {
    let path = require("path")

    // Redirect all paths starting with "@modules/" to "src/scripts/modules"
    build.onResolve({ filter: /^@modules\// }, (args) => {
      // get such `@modules/mobile-nav` without the `@module` part
      let moduleName = args.path.split("/")[1]
      return { path: path.resolve("src/scripts/modules", moduleName, "index.js") }
    })

    build.onResolve({ filter: /^@utilities\// }, (args) => {
      let moduleName = args.path.split("/")[1]
      return { path: path.resolve("src/scripts/utilities", moduleName, "index.js") }
    })
  },
}

let is_minified = process.env.NODE_ENV === "production" ? true : false

build({
  entryPoints: ["src/scripts/main.js"],
  outfile: "dist/scripts/main.js",
  bundle: true,
  minify: is_minified,
  plugins: [onResolvePlugin],
}).catch(() => process.exit(1))
