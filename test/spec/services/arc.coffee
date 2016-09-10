'use strict'

describe 'Service: Arc', ->

  # load the service's module
  beforeEach module 'progressArcApp'

  # instantiate service
  Arc = {}
  beforeEach inject (_Arc_) ->
    Arc = _Arc_

  it 'should do something', ->
    expect(!!Arc).toBe true
