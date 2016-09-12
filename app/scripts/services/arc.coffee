'use strict'

###*
 # @ngdoc service
 # @name progressArcApp.Arc
 # @description
 # # Arc
 # Factory in the progressArcApp.
###
    # Service logic
    # ...

Arc = (Color, Conversion) ->
    arcData = (actual, expected, radius = 100) ->
        return [{
            name: 'base'
            type: 'path'
            fill: Color.base
            innerRadius: 0
            outerRadius: radius * 0.65
            cornerRadius: 2 * Math.PI
            startAngle: 0
            endAngle: 2 * Math.PI
        },
        {
            name: 'actual'
            type: 'path'
            fill: Color.primary
            innerRadius: radius * 0.8
            outerRadius: radius * 0.95
            cornerRadius: 2 * Math.PI
            startAngle: 0
            endAngle: Conversion.floatToRadians actual
            displayValue: Conversion.floatToPercent actual
            hasTransition: true
            hasColorTransition: true
        },
        {
            name: 'expected'
            type: 'path'
            fill: Color.secondary
            innerRadius: radius * 0.7
            outerRadius: radius * 0.75
            cornerRadius: 2 * Math.PI
            startAngle: 0
            endAngle: Conversion.floatToRadians expected
            hasTransition: true
        }]

    displayData = (actual) ->
        return [{
            type: 'number'
            value: Conversion.floatToPercent actual
        }]

    initialState = d3.arc()
            .innerRadius (d) -> d.innerRadius
            .outerRadius (d) -> d.outerRadius
            .startAngle (d) -> 0
            .endAngle (d) -> 0
            .cornerRadius (d) -> d.cornerRadius

    endState = d3.arc()
            .innerRadius (d) -> d.innerRadius
            .outerRadius (d) -> d.outerRadius
            .startAngle (d) -> d.startAngle
            .endAngle (d) -> d.endAngle
            .cornerRadius (d) -> d.cornerRadius

    arcTween = (d) ->
        interpolate = d3.interpolate d.startAngle, d.endAngle
        (t) ->
            d.endAngle = interpolate t
            endState d

    numberTween = (textElement, d) ->
        interpolate = d3.interpolate 0, d.value
        (t) ->
            textElement.textContent = Math.round(interpolate t)

    tween = {
        path: arcTween
        number: numberTween
    }

    return {
        arcData: arcData
        displayData: displayData
        initialState: initialState
        endState: endState
        tween: tween
    }

Arc.$inject = ['Color', 'Conversion']

angular.module 'progressArcApp'
  .factory 'Arc', Arc
