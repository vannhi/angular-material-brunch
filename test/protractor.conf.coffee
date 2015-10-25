exports.config =
  framework: 'mocha'
  baseUrl: 'http://localhost:3333'
  capabilities:
    browserName: 'chrome'
    # browserName: 'phantomjs'
    # 'phantomjs.binary.path': require('phantomjs').path
  specs: ['integration.coffee']
