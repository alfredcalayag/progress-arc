'use strict'

describe 'Service: Arc', ->

    # load the service's module
    beforeEach module 'progressArcApp'

    # instantiate service
    Arc = {}
    beforeEach inject ($injector) ->
        Arc = $injector.get 'Arc'

    describe 'arcData', ->
        arcData = undefined
        beforeEach ->
            arcData = Arc.arcData 0.5, 0.5

        it 'should return an array of 3 items', ->
            expect(arcData.length).toBe 3

        it 'each item should be an object', ->
            arcData.forEach (item) ->
                expect(typeof item).toBe 'object'

    describe 'initialState', ->
        it 'should generate a path', ->
            data = {
                name: 'base'
                type: 'path'
                innerRadius: 0
                outerRadius: 55
                cornerRadius: 2 * Math.PI
                startAngle: 0
                endAngle: 2 * Math.PI
            }
            expect(Arc.initialState(data)).toContain('M')

    describe 'endState', ->
        it 'should generate a path', ->
            data = {
                name: 'base'
                type: 'path'
                innerRadius: 0
                outerRadius: 55
                cornerRadius: 2 * Math.PI
                startAngle: 0
                endAngle: 2 * Math.PI
            }
            expect(Arc.endState(data)).toContain('M')

    describe 'tween functions', ->
        tween = undefined
        beforeEach ->
            tween = Arc.tween

        describe 'arc', ->
            data = undefined
            beforeEach ->
                data = {
                    startAngle: 0
                    endAngle: 2.10
                }
            it 'should return a function', ->
                expect(typeof tween.path(data)).toBe 'function'

            it 'the function should return a path', ->
                expect(tween.path(data) 0).toContain 'M'

        describe 'number', ->
            textElement = undefined
            data = undefined
            beforeEach ->
                textElement = angular.element '<text>0</text>'
                data = {
                    value: 100
                }
            it 'should return a function', ->
                expect(typeof tween.number(textElement, data)).toBe 'function'

            it 'the function should return a Number', ->
                expect(tween.number(textElement, data) 0).toEqual jasmine.any Number

            it 'should return 0 at time 0', ->
                expect(tween.number(textElement, data) 0).toEqual 0

            it 'should return the data\'s value at time 1', ->
                expect(tween.number(textElement, data) 1).toEqual data.value