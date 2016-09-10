'use strict'

describe 'Controller: AboutCtrl', ->

  # load the controller's module
  beforeEach module 'progressArcApp'

  vm = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    vm = $controller 'AboutCtrl', {
      $scope: scope
    }
    return

  it 'should attach a list of awesomeThings to the scope', ->
    expect(vm.awesomeThings.length).toBe 3
    return
  return
