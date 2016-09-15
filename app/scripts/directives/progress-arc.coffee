'use strict'

###*
 # @ngdoc directive
 # @name progressArcApp.directive:progressArc
 # @description
 # # progressArc
###

progressArc = (Arc, Color, Conversion) ->
    restrict: 'E'
    scope:
        actual: '='
        expected: '='
        label: '<'
        radius: '<'
    link: (scope, element, attrs) ->
        if !Conversion.isValidFloat(scope.actual) or !Conversion.isValidFloat(scope.expected)
            throw TypeError 'Input should be a number between 0 and 1.0'

        svg = d3.select element[0]
            .append 'svg'
            .attr 'class', 'progress-arc'
            .attr 'width', scope.radius * 2 || 200
            .attr 'height', scope.radius * 2 || 200
        g = svg
            .append 'g'
            .attr 'transform', 'translate(100, 100)'

        # get arc data
        arcData = Arc.arcData scope.radius
        # create arc references and apply data to the grouping
        arcBase = g.append 'path'
            .datum arcData[0]
        arcActual = g.append 'path'
            .datum arcData[1]
        arcExpected = g.append 'path'
            .datum arcData[2]

        # decorate arcs
        g.selectAll('path')
            .attr 'class', (d) ->
                d.type + '-' + d.name
            .style 'fill', (d) -> d.fill

        # append text elements
        displayValue = svg.append 'text'
            .data Arc.displayData scope.actual
            .attr 'transform', 'translate(100, 100)'
            .attr 'class', 'value'
            .text (d) -> '0'

        svg.append 'text'
            .attr 'transform', 'translate(100, 100)'
            .attr 'class', 'label'
            .attr 'y', (d) -> 20
            .text (d) -> scope.label or 'Progress'

        svg.append 'text'
            .attr 'transform', 'translate(100, 100)'
            .attr 'class', 'format'
            .attr 'x', 33
            .text (d) -> '%'

        defaultInput = (input) ->
            if Number(input) && input > 1 then 1 else 0

        hasInputError = (input) ->
            return !Conversion.isValidFloat(input)

        updateArc = (arc, newAngle) ->
            arc
                .transition()
                .delay 100
                .duration 1000
                .attrTween 'd', (d) -> Arc.tween[d.type](d, newAngle)
                .style 'fill', (d) ->
                    if d.hasColorTransition then Color.getMoodColor(scope.actual, scope.expected) else d.fill

        updateText = (textElement, newNumber) ->
            textElement.transition()
                .delay 100
                .duration 1000
                .tween 'text', (d) -> Arc.tween[d.type](this, newNumber)

        redraw = () ->
            updateArc(arcActual, Conversion.floatToRadians scope.actual)
            updateArc(arcExpected, Conversion.floatToRadians scope.expected)
            updateText(displayValue, Conversion.floatToPercent scope.actual)

        updateProgress = (type) ->
            input = scope[type]
            inputIsValid = Conversion.isValidFloat(input)
            scope[type] = if inputIsValid then scope[type] else defaultInput(scope[type])
            redraw()
            if !inputIsValid
                message = 'Saw "' + type + '"' + ' input value: "' + input + '". ' +
                    '"' + type + '"' + ' input should be a number between 0 and 1.0. ' +
                    'Input has been defaulted to ' + scope[type] + '. Please try again.'
                throw TypeError message

        scope.$watch 'actual', () ->
            updateProgress('actual')
        scope.$watch 'expected', () ->
            updateProgress('expected')

progressArc.$inject = ['Arc', 'Color', 'Conversion']

angular.module 'progressArcApp'
    .directive 'progressArc', progressArc