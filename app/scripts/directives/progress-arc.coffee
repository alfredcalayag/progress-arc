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
        actual: '<'
        expected: '<'
        label: '<'
        radius: '<'
    link: (scope, element, attrs) ->
        if !Conversion.isValidFloat(scope.actual) or !Conversion.isValidFloat(scope.expected)
            throw TypeError 'Input should be a number between 0 and 1.0'
        # svg = d3.select 'svg'
        svg = d3.select element[0]
            .append 'svg'
            .attr 'class', 'progress-arc'
            .attr 'width', scope.radius * 2 || 200
            .attr 'height', scope.radius * 2 || 200

        # append arc data
        g = svg
            .append 'g'
            .attr 'transform', 'translate(100, 100)'
            .selectAll 'path'
            .data Arc.arcData scope.actual, scope.expected
            .enter()
            .append 'path'
            .attr 'd', (d) ->
                if d.hasTransition then Arc.initialState(d) else Arc.endState(d)
            .attr 'class', (d) -> d.type + '-' + d.name
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
            .text (d) -> scope.label

        svg.append 'text'
            .attr 'transform', 'translate(100, 100)'
            .attr 'class', 'format'
            .attr 'x', 25
            .text (d) -> '%'

        # Get set... DRAW!!
        g.filter (d) -> d.hasTransition
            .transition()
            .delay 50
            .duration 2000
            .style 'fill', (d) ->
                if d.hasColorTransition then Color.getMoodColor(scope.actual, scope.expected) else d.fill
            .attrTween 'd', (d) -> Arc.tween[d.type](d)

        displayValue.transition()
            .delay 50
            .duration 2000
            .tween 'text', (d) -> Arc.tween[d.type](this, d)

progressArc.$inject = ['Arc', 'Color', 'Conversion']

angular.module 'progressArcApp'
  .directive 'progressArc', progressArc