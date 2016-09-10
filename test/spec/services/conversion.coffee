'use strict'

describe 'Service: Conversion', ->

  # load the service's module
  beforeEach module 'progressArcApp'

  # instantiate service
  Conversion = {}
  beforeEach inject (_Conversion_) ->
    Conversion = _Conversion_

  it 'should do something', ->
    expect(!!Conversion).toBe true
