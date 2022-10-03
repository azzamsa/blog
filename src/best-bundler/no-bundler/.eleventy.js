module.exports = function (eleventyConfig) {

  eleventyConfig.addPassthroughCopy("./src/images")
  eleventyConfig.addPassthroughCopy("./src/fonts")

  return {
    dir: {
      input: 'src',
      output: 'dist',
    },
    templateFormats: ['njk'],
    htmlTemplateEngine: 'njk',
  };
};
