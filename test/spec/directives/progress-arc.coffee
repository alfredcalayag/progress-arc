'use strict'

describe 'Directive: progressArc', ->

    # load the directive's module
    beforeEach module 'progressArcApp'

    scope = {}

    beforeEach inject ($controller, $rootScope) ->
        scope = $rootScope.$new()

    describe 'progressArc Directive', ->
        describe 'Renders with with valid inputs', ->
            element = undefined
            beforeEach inject ($compile) ->
                element = angular.element '<progress-arc actual=0.5 expected=1></progress-arc>'
                element = $compile(element) scope

            it 'should render a svg with valid inputs', ->
                expect(element.find('svg').length).toEqual 1

            it 'should render a text with a class "value"', ->
                expect(element[0].querySelector('text.value')).toBeDefined()

            it 'should render a text with a class "format" displaying "%"', ->
                expect(element[0].querySelector('text.format').textContent).toEqual('%')

            it 'should render a text with a class "label"', ->
                expect(element[0].querySelector('text.label')).toBeDefined()

            it 'should render the actual arc path with a class "path-actual"', ->
                expect(element[0].querySelector('path.path-actual')).toBeDefined()

            it 'should render the actual arc path with a class "path-expected"', ->
                expect(element[0].querySelector('path.path-expected')).toBeDefined()

        describe 'Does NOT render with invalid inputs', ->
            it 'should NOT render a svg if a String input is attempted', inject ($compile) ->
                element = angular.element '<progress-arc actual="invalidInput" expected=0.5></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0

                element = angular.element '<progress-arc actual="0.5" expected="invalidInput"></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0

            it 'should NOT render a svg if an invalid number input is attempted', inject ($compile) ->
                element = angular.element '<progress-arc actual=-1 expected=0.1></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0

                element = angular.element '<progress-arc actual=1.1 expected=0.1></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0

            it 'should NOT render a svg if a required input is missing', inject ($compile) ->
                element = angular.element '<progress-arc actual=undefined expected=0.1></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0

                element = angular.element '<progress-arc expected=0.1></progress-arc>'
                element = $compile(element) scope
                expect(element.find('svg').length).toEqual 0