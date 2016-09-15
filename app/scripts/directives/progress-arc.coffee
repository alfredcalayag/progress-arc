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
        handleInputError = (type, input, defaultedInput, errorAllowed) ->
            message = 'Saw "' + type + '"' + ' input value: "' + input + '". ' +
                '"' + type + '"' + ' input should be a number between 0 and 1.0. ' +
                'Input has been defaulted to ' + defaultedInput + '. Please try again.'
            if errorAllowed
                # Allow widget to initialize
                console.log message
            else throw TypeError message

        defaultInput = (input) ->
            if Number(input) && input > 1 then 1 else 0

        validateInput = (type, errorAllowed) ->
            input = scope[type]
            inputIsValid = Conversion.isValidFloat(input)
            scope[type] = if inputIsValid then scope[type] else defaultInput(scope[type])
            {
                isValid: inputIsValid
                type: type
                input: input
                defaultedInput: scope[type]
            }
            if !inputIsValid then handleInputError type, input, scope[type], errorAllowed

        ['actual', 'expected'].forEach (type) -> validateInput(type, true)

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
            .attr 'd', (d) -> Arc.endState d
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

        redraw = () ->
            g.selectAll('*').interrupt()
            Arc.updateArc(arcActual, scope.actual, scope.expected)
            Arc.updateArc(arcExpected, scope.expected)
            Arc.updateText(displayValue, Conversion.floatToPercent scope.actual)

        updateProgress = (type) ->
            validateInput type
            redraw()

        scope.$watch 'actual', () -> updateProgress('actual')
        scope.$watch 'expected', () -> updateProgress('expected')

progressArc.$inject = ['Arc', 'Color', 'Conversion']

angular.module 'progressArcApp'
    .directive 'progressArc', progressArc