component_path = 'app/components/'

webpack = require 'webpack'

module.exports =
   entry: [
      'script!jquery/dist/jquery.min.js'
      'script!foundation-sites/dist/foundation.min.js'
      './app/app.cjsx'
   ]
   externals: {
      jquery: 'jQuery'
   }
   plugins: [
      new webpack.ProvidePlugin
         '$': 'jquery'
         'jQuery': 'jquery'
   ]
   output:
      path: __dirname
      filename: './public/bundle.js'
   resolve:
      root: __dirname
      alias: {
         #Format is ComponentName: 'path/to/ComponentName.coffee'
         # This allows use to just requie('ComponentName') instead of providing paths
         Main: component_path + 'Main.coffee'
         Nav: component_path + 'Nav.coffee'
         Countdown: component_path + 'Countdown.coffee'
         CountdownForm: component_path + 'CountdownForm.coffee'
         Timer: component_path + 'Timer.coffee'
         Clock: component_path + 'Clock.coffee'
         applicationStyles: 'app/styles/app.scss'
      }
      extensions: [
         ''
         '.js'
         '.coffee'
         '.cjsx'
      ]
   module:
      loaders: [
         loader: 'coffee-jsx-loader'
         test: /(\.coffee|\.cjsx)$/,
         exclude: /(node_modules|bower_components)/
      ]
   devtool: 'cheap-module-eval-source-map'
