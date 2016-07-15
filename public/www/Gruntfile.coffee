module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    shell:
      "compile-coffee-watch":
        command: "coffee --output js/ -b -c -w coffee/"
      "compile-coffee":
        command: "coffee --output js/ -b -c coffee/"
      "compile-sass-watch":
        command: "./node_modules/node-sass/bin/node-sass -w sass/app.sass css/app.css"
      "compile-sass":
        command: "./node_modules/node-sass/bin/node-sass sass/app.sass css/app.css"

    postcss:
      options:
        map: false

        processors: [
          require("autoprefixer")(browsers: "last 2 versions")
        ]

      dist:
        src: "css/*.css"


  grunt.registerTask "compile:coffee:watch", ["shell:compile-coffee-watch"]
  grunt.registerTask "compile:coffee", ["shell:compile-coffee"]
  grunt.registerTask "compile:sass:watch", ["shell:compile-sass-watch"]
  grunt.registerTask "compile:sass", ["shell:compile-sass"]

  grunt.registerTask "coffee", ['compile:coffee:watch']
  grunt.registerTask "sass", ['compile:sass:watch']
  grunt.registerTask "default", ["compile:coffee", "compile:sass", "postcss"]

  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-postcss"
