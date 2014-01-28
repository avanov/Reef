module.exports = (grunt) ->
    # Configure the pyrablog-frontend project builder
    # -------------------------------------------
    SOURCE_DIR = "./src"
    SRC_VENDORS_DIR = "#{SOURCE_DIR}/3rdparty"
    SRC_CSS_DIR = "#{SOURCE_DIR}/css"

    # -----------------------------------------------
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        compass:
            dist:
                options:
                    basePath: SOURCE_DIR
                    config: "#{SOURCE_DIR}/config.rb"

        concat:
            options:
                separator: '\n'
            css:
                src: [
                    "#{SRC_CSS_DIR}/screen.css",
                    "#{SRC_VENDORS_DIR}/bootstrap/css/bootstrap.css"
                    ]
                dest: "#{SRC_CSS_DIR}/styles.css"

    # -----------------------------------------------
    # Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks plugin for plugin in [
        'grunt-contrib-compass'
        'grunt-contrib-concat'
        ]

    # ------------------------------------------------
    grunt.registerTask 'default', [
        'compass'
        'concat'
        ]
