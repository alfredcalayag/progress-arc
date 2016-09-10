// Generated by CoffeeScript 1.10.0
'use strict';

/**
  * @ngdoc directive
  * @name progressArcApp.directive:progressArc
  * @description
  * # progressArc
 */
var progressArc;

progressArc = function(Arc, Color) {
  return {
    restrict: 'E',
    scope: {
      actual: '<',
      expected: '<',
      label: '<'
    },
    templateUrl: 'views/templates/progress-arc.html',
    controller: 'ProgressArcCtrl',
    controllerAs: 'vm',
    link: function(scope, element, attrs) {
      var displayValue, g, svg;
      svg = d3.select('svg').attr('width', 200).attr('height', 200);
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
        return scope.label;
      });
      svg.append('text').attr('transform', 'translate(100, 100)').attr('class', 'percent').attr('x', 25).text(function(d) {
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

progressArc.$inject = ['Arc', 'Color'];

angular.module('progressArcApp').directive('progressArc', progressArc);
