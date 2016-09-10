'use strict'

describe 'Directive: myTestDirective', ->

  # load the directive's module
  beforeEach module 'progressArcApp'
  beforeEach module 'views/templates/mytestdirective.html'

  scope = {}
  element = {}

  beforeEach inject ($rootScope, $compile) ->
    scope = $rootScope.$new()
    element = angular.element '<my-test-directive></my-test-directive>'
    element = $compile(element) scope
    scope.$digest();

  it 'should display the entire description', inject () ->
    expect(element.text()).toBe 'Description: Back in business'
  return
