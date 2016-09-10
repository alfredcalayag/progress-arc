'use strict'

describe 'Directive: progressArc', ->

    # load the directive's module
    beforeEach module 'progressArcApp'

    scope = {}

    beforeEach inject ($controller, $rootScope) ->
        scope = $rootScope.$new()

    it 'should make hidden element visible', inject ($compile) ->
        element = angular.element '<progress-arc></progress-arc>'
        element = $compile(element) scope
        expect(element.text()).toContain 'Progress'

    it 'should accept 2 inputs \'actual\' and \'expected\'', inject ($compile) ->
        element = angular.element '<progress-arc actual=60 expected=80></progress-arc>'
        element = $compile(element) scope
        expect(element.text())
            .toContain('Actual: 60')
            .and
            .toContain('Estimated: 80')