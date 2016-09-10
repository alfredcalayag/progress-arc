'use strict'

describe 'Filter: floatToPercent', ->

  # load the filter's module
  beforeEach module 'progressArcApp'

  # initialize a new instance of the filter before each test
  floatToPercent = {}
  beforeEach inject ($filter) ->
    floatToPercent = $filter 'floatToPercent'

  it 'should return the input prefixed with "floatToPercent filter:"', ->
    floatInput = 0.1
    expect(floatToPercent floatInput).toBe ('10%')
