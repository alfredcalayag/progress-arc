'use strict'

describe 'Controller: ProgressArcCtrl', ->

    # load the controller's module
    beforeEach module 'progressArcApp'

    vm = {}
    scope = {}

    # Initialize the controller and a mock scope
    beforeEach inject ($controller, $rootScope) ->
        scope = $rootScope.$new()
        vm = $controller 'ProgressArcCtrl', {
          # place here mocked dependencies
        }
        return

    it 'should contain a title property', ->
        expect(vm).toEqual(jasmine.objectContaining({title: 'Progress'}))
        return
    it 'should contain an \'actual property whose value is a Number', ->
        expect(vm.actual).toEqual(jasmine.any(Number))
        return
    it 'should contain an \'expected property whose value is a Number', ->
        expect(vm.expected).toEqual(jasmine.any(Number))
        return

    return