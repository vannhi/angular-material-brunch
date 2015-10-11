'use strict'

expect = chai.expect

describe "directives", ->

  beforeEach(module "app.directives")

  describe "app-version", ->

    it "should print current version", ->
      module ($provide) ->
        $provide.value "version", "TEST_VER"
        return

      inject ($compile, $rootScope) ->
        element = $compile("<span app-version></span>")($rootScope)
        expect(element.text()).to.equal "TEST_VER"
