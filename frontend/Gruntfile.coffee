module.exports = (grunt) ->
    # Configure the pyrablog-frontend project builder
    # -------------------------------------------
    SOURCE_DIR = "./"
    SOURCE_VENDORS_DIR = "#{SOURCE_DIR}/vendors"

    # -----------------------------------------------
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        compass:
            dist:
                options:
                    basePath: SOURCE_DIR
                    config: "#{SOURCE_DIR}/config.rb"

    # -----------------------------------------------
    # Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks plugin for plugin in [
        'grunt-contrib-compass'
    ]

    # ------------------------------------------------
    grunt.registerTask 'default', [
        'compass'
    ]
