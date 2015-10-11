# Karma configuration
# Generated on Sun Oct 11 2015 01:38:48 GMT+0200 (CEST)

module.exports = (config) ->
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '..'


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['ng-scenario']


    # list of files / patterns to load in the browser
    files: [
        'test/e2e/**/*.coffee'
    ]


    # list of files to exclude
    exclude: [
    ]


    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
        '**/*.coffee': ['coffee']
    }


    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']


    # web server port
    port: 9876


    # enable / disable colors in the output (reporters and logs)
    colors: true


    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO

    urlRoot: '/__karma/'

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS']

    plugins: [
        'karma-ng-scenario'
        'karma-coffee-preprocessor'
        'karma-phantomjs-launcher'
    ]

    proxies: 
      '/': 'http://localhost:3333/'

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false
