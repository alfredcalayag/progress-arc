(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name progressArcApp.Arc
    * @description
    * # Arc
    * Factory in the progressArcApp.
   */
  var Arc;

  Arc = function(Color, Conversion) {
    var arcData, arcTween, displayData, endState, initialState, numberTween, tween;
    arcData = function(actual, expected, radius) {
      if (radius == null) {
        radius = 100;
      }
      return [
        {
          name: 'base',
          type: 'path',
          fill: Color.base,
          innerRadius: 0,
          outerRadius: radius * 0.65,
          cornerRadius: 2 * Math.PI,
          startAngle: 0,
          endAngle: 2 * Math.PI
        }, {
          name: 'actual',
          type: 'path',
          fill: Color.primary,
          innerRadius: radius * 0.8,
          outerRadius: radius * 0.95,
          cornerRadius: 2 * Math.PI,
          startAngle: 0,
          endAngle: Conversion.floatToRadians(actual),
          displayValue: Conversion.floatToPercent(actual),
          hasTransition: true,
          hasColorTransition: true
        }, {
          name: 'expected',
          type: 'path',
          fill: Color.secondary,
          innerRadius: radius * 0.7,
          outerRadius: radius * 0.75,
          cornerRadius: 2 * Math.PI,
          startAngle: 0,
          endAngle: Conversion.floatToRadians(expected),
          hasTransition: true
        }
      ];
    };
    displayData = function(actual) {
      return [
        {
          type: 'number',
          value: Conversion.floatToPercent(actual)
        }
      ];
    };
    initialState = d3.arc().innerRadius(function(d) {
      return d.innerRadius;
    }).outerRadius(function(d) {
      return d.outerRadius;
    }).startAngle(function(d) {
      return 0;
    }).endAngle(function(d) {
      return 0;
    }).cornerRadius(function(d) {
      return d.cornerRadius;
    });
    endState = d3.arc().innerRadius(function(d) {
      return d.innerRadius;
    }).outerRadius(function(d) {
      return d.outerRadius;
    }).startAngle(function(d) {
      return d.startAngle;
    }).endAngle(function(d) {
      return d.endAngle;
    }).cornerRadius(function(d) {
      return d.cornerRadius;
    });
    arcTween = function(d) {
      var interpolate;
      interpolate = d3.interpolate(d.startAngle, d.endAngle);
      return function(t) {
        d.endAngle = interpolate(t);
        return endState(d);
      };
    };
    numberTween = function(textElement, d) {
      var interpolate;
      interpolate = d3.interpolate(0, d.value);
      return function(t) {
        return textElement.textContent = Math.round(interpolate(t));
      };
    };
    tween = {
      path: arcTween,
      number: numberTween
    };
    return {
      arcData: arcData,
      displayData: displayData,
      initialState: initialState,
      endState: endState,
      tween: tween
    };
  };

  Arc.$inject = ['Color', 'Conversion'];

  angular.module('progressArcApp').factory('Arc', Arc);

}).call(this);

//# sourceMappingURL=arc.js.map
