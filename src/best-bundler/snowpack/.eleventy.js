module.exports = function (eleventyConfig) {

  // handled by snowpack
  // eleventyConfig.addPassthroughCopy("./src/images")
  // eleventyConfig.addPassthroughCopy("./src/fonts")

  return {
    dir: {
      input: 'src',
      output: 'eleventy',
    },
    templateFormats: ['njk'],
    htmlTemplateEngine: 'njk',
  };
};
