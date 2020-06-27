const path = require('path')

// vue.config.js
module.exports = {
  pages: {
    gameTranslation: {
      entry: 'src/main.js'
    }
  },
  // disable hashes in filenames
  filenameHashing: false,
  // delete HTML related webpack plugins
  chainWebpack: config => {
    config.plugins.delete('html')
    config.plugins.delete('preload')
    config.plugins.delete('prefetch')
  },
  outputDir: path.resolve(__dirname, '../priv/static/js')
}