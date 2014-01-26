SOURCE_DIR = "."
SOURCE_VENDORS_DIR = "#{SOURCE_DIR}/3rdparty"


gulp = require 'gulp'
compass = require 'gulp-compass'


gulp.task 'compass', ->
    gulp.src("#{SOURCE_DIR}/sass/**")
        .pipe compass
            config_file: "#{SOURCE_DIR}/config.rb"


gulp.task 'default', ['compass'], ->

