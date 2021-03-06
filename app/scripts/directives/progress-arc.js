(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name progressArcApp.directive:progressArc
    * @description
    * # progressArc
   */
  var progressArc;

  progressArc = function(Arc, Color, Conversion) {
    return {
      restrict: 'E',
      scope: {
        actual: '<',
        expected: '<',
        label: '<',
        radius: '<'
      },
      link: function(scope, element, attrs) {
        var displayValue, g, svg;
        if (!Conversion.isValidFloat(scope.actual) || !Conversion.isValidFloat(scope.expected)) {
          throw TypeError('Input should be a number between 0 and 1.0');
        }
        svg = d3.select(element[0]).append('svg').attr('class', 'progress-arc').attr('width', scope.radius * 2 || 200).attr('height', scope.radius * 2 || 200);
        g = svg.append('g').attr('transform', 'translate(100, 100)').selectAll('path').data(Arc.arcData(scope.actual, scope.expected)).enter().append('path').attr('d', function(d) {
          if (d.hasTransition) {
            return Arc.initialState(d);
          } else {
            return Arc.endState(d);
          }
        }).attr('class', function(d) {
          return d.type + '-' + d.name;
        }).style('fill', function(d) {
          return d.fill;
        });
        displayValue = svg.append('text').data(Arc.displayData(scope.actual)).attr('transform', 'translate(100, 100)').attr('class', 'value').text(function(d) {
          return '0';
        });
        svg.append('text').attr('transform', 'translate(100, 100)').attr('class', 'label').attr('y', function(d) {
          return 20;
        }).text(function(d) {
          return scope.label || 'Progress';
        });
        svg.append('text').attr('transform', 'translate(100, 100)').attr('class', 'format').attr('x', 33).text(function(d) {
          return '%';
        });
        g.filter(function(d) {
          return d.hasTransition;
        }).transition().delay(50).duration(2000).style('fill', function(d) {
          if (d.hasColorTransition) {
            return Color.getMoodColor(scope.actual, scope.expected);
          } else {
            return d.fill;
          }
        }).attrTween('d', function(d) {
          return Arc.tween[d.type](d);
        });
        return displayValue.transition().delay(50).duration(2000).tween('text', function(d) {
          return Arc.tween[d.type](this, d);
        });
      }
    };
  };

  progressArc.$inject = ['Arc', 'Color', 'Conversion'];

  angular.module('progressArcApp').directive('progressArc', progressArc);

}).call(this);

//# sourceMappingURL=progress-arc.js.map
