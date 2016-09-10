'use strict'

describe 'Controller: MyTestCtrl', ->

  # load the controller's module
  beforeEach module 'progressArcApp'

  vm = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    vm = $controller 'MyTestCtrl', {
      # place here mocked dependencies
    }

  it 'should provide a default description', ->
    expect(vm.description).toBe 'Back in business'
