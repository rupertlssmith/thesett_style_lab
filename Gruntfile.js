module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-compress');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-html2js');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-bower-task');
    grunt.loadNpmTasks('grunt-responsive-images');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-ng-annotate');
    grunt.loadNpmTasks('grunt-angular-templates');
    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-elm');

    grunt.initConfig({
        'pkg': grunt.file.readJSON('package.json'),

        'bower': {
            install: {
                options: {
                    install: true,
                    copy: false,
                    targetDir: 'assets/bower_components',
                    cleanTargetDir: false
                }
            }
        },

        'jshint': {
            'beforeconcat': ['src/js/**/*.js'],
        },

        'elm': {
            compile: {
                files: {
                    'app/style-lab.js': ['src/elm/**/*.elm']
                }
            }
        },

        'copy': {
            'dist': {
                files: [{
                    expand: true,
                    cwd: 'src/views',
                    src: ['**'],
                    dest: 'app/views'
                }, {
                    expand: true,
                    cwd: 'src/styles',
                    src: ['**'],
                    dest: 'app/styles'
                }, {
                    expand: true,
                    cwd: 'bower_components/thesett-laf/app',
                    src: ['**'],
                    dest: 'app'
                }, {
                    expand: true,
                    cwd: 'src',
                    src: ['index.html'],
                    dest: 'app'
                }],
            }
        },

        'concat': {
            options: {
                separator: ';\n'
            },
            'sources': {
                'src': [
                    'src/js/**/*.js'
                ],
                'dest': 'app/<%= pkg.name %>.js'
            }
        },

        'uglify': {
            'options': {
                'mangle': false
            },
            'dist': {
                'files': {
                    'app/<%= pkg.name %>.min.js': ['app/<%= pkg.name %>.js']
                }
            }
        },

        'responsive_images': {
            'dist': {
                options: {
                    engine: 'im',
                    sizes: [{
                        width: '100%',
                        name: 'large',
                        suffix: '.x2'
                    }, {
                        width: '100%',
                        name: 'medium',
                        suffix: '.x2'
                    }, {
                        width: '90%',
                        name: 'small',
                        suffix: '.x2'
                    }, {
                        width: '50%',
                        name: 'large'
                    }, {
                        width: '50%',
                        name: 'medium'
                    }, {
                        width: '40%',
                        name: 'small'
                    }]
                },
                files: [{
                    expand: true,
                    cwd: 'src/images',
                    src: ['**/*.{jpg,gif,png}'],
                    dest: 'app/images'
                }]
            }
        },

        'compress': {
            dist: {
                options: {
                    archive: 'dist/<%= pkg.name %>-<%= pkg.version %>.zip'
                },
                files: [{
                    src: ['app/**', 'server.js'],
                    dest: '/'
                }]
            }
        },

        'connect': {
            server: {
                options: {
                    hostname: 'localhost',
                    port: 9072,
                    base: 'app'
                }
            }
        },

        'exec': {
            'webjar': {
                command: './make-webjar'
            },
            'zipdist': {
                command: './install-zip'
            }
        },


        'watch': {
            'dev': {
                files: ['Gruntfile.js', 'bower.json', 'elm-package.json', 'server.js', 'config.rb', 'src/**'],
                tasks: ['build'],
                options: {
                    atBegin: true
                }
            },
            'min': {
                files: ['Gruntfile.js', 'src/**'],
                tasks: ['package'],
                options: {
                    atBegin: true
                }
            }
        },

        'clean': {
            temp: {
                src: ['tmp', 'app', 'dist']
            }
        },
    });

    grunt.registerTask('dev', ['bower', 'connect:server', 'watch:dev']);
    grunt.registerTask('minified', ['bower', 'connect:server', 'watch:min']);
    grunt.registerTask('build', ['bower', 'copy', 'elm', 'responsive_images']);
    grunt.registerTask('package', ['build', 'uglify', 'compress', 'exec:webjar', 'exec:zipdist']);
};
