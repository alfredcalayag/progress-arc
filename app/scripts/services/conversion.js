(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name progressArcApp.Conversion
    * @description
    * # Conversion
    * Factory in the progressArcApp.
   */
  var Conversion;

  Conversion = function() {
    var floatToPercent, floatToRadians, isValidFloat;
    floatToRadians = function(percent) {
      return percent * 360 * Math.PI / 180;
    };
    floatToPercent = function(float) {
      return Math.round(float * 100);
    };
    isValidFloat = function(input) {
      return input >= 0 && input <= 1;
    };
    return {
      floatToRadians: floatToRadians,
      floatToPercent: floatToPercent,
      isValidFloat: isValidFloat
    };
  };

  angular.module('progressArcApp').factory('Conversion', Conversion);

}).call(this);

//# sourceMappingURL=conversion.js.map
