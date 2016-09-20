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
    arcData = (radius = 100) ->
        {
            base: {
                name: 'base'
                type: 'path'
                fill: Color.base
                innerRadius: 0
                outerRadius: radius * 0.65
                cornerRadius: 2 * Math.PI
                startAngle: 0
                endAngle: 2 * Math.PI
            },
            actual: {
                name: 'actual'
                type: 'path'
                fill: Color.primary
                innerRadius: radius * 0.8
                outerRadius: radius * 0.95
                cornerRadius: 2 * Math.PI
                startAngle: 0
                endAngle: 0
                displayValue: 0
                hasTransition: true
                hasColorTransition: true
            },
            expected: {
                name: 'expected'
                type: 'path'
                fill: Color.secondary
                innerRadius: radius * 0.7
                outerRadius: radius * 0.75
                cornerRadius: 2 * Math.PI
                startAngle: 0
                endAngle: 0
                hasTransition: true
            }
        }

    displayData = (actual) ->
        return [{
            type: 'number'
            value: Conversion.floatToPercent actual
        }]

    d3Arc = d3.arc()
            .innerRadius (d) -> d.innerRadius
            .outerRadius (d) -> d.outerRadius
            .startAngle (d) -> d.startAngle
            .endAngle (d) -> d.endAngle
            .cornerRadius (d) -> d.cornerRadius

    arcTween = (d, newAngle) ->
        interpolate = d3.interpolate d.endAngle, newAngle
        (t) ->
            d.endAngle = interpolate t
            d3Arc d

    numberTween = (textElement, newNumber) ->
        interpolate = d3.interpolate Number(textElement.textContent), newNumber
        (t) ->
            textElement.textContent = Math.round(interpolate t)

    updateArc = (arc, newArcValue, expectedArcValue) ->
            arc
                .transition()
                .delay 100
                .duration 1000
                .attrTween 'd', (d) -> tween[d.type](d, Conversion.floatToRadians newArcValue)
                .style 'fill', (d) ->
                    if d.hasColorTransition then Color.getMoodColor(newArcValue, expectedArcValue) else d.fill

    updateText = (textElement, newNumber) ->
        textElement.transition()
            .delay 100
            .duration 1000
            .tween 'text', (d) -> tween[d.type](this, newNumber)

    tween = {
        path: arcTween
        number: numberTween
    }

    return {
        arcData: arcData
        displayData: displayData
        d3Arc: d3Arc
        updateArc: updateArc
        updateText: updateText
    }

Arc.$inject = ['Color', 'Conversion']

angular.module 'progressArcApp'
  .factory 'Arc', Arc
