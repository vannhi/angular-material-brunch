'use strict'

expect = chai.expect

describe "service", ->

  beforeEach(module "app.services")

  describe "version", ->
    it "should return current version", inject((version) ->
      expect(version).to.equal "0.1"
    )
