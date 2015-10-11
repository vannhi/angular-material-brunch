'use strict'

expect = chai.expect

describe "filter", ->
  beforeEach(module "app.filters")

  describe "interpolate", ->

    beforeEach(module(($provide) ->
      $provide.value "version", "TEST_VER"
      return
    ))

    it "should replace VERSION", inject((interpolateFilter) ->
      expect(interpolateFilter("before %VERSION% after")).to.equal "before TEST_VER after"
    )
