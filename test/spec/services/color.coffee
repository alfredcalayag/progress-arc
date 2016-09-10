'use strict'

describe 'Service: Color', ->

  # load the service's module
  beforeEach module 'progressArcApp'

  # instantiate service
  Color = {}
  beforeEach inject (_Color_) ->
    Color = _Color_

  it 'should do something', ->
    expect(!!Color).toBe true
