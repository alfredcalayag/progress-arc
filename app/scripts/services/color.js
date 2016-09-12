(function() {
  'use strict';

  /**
    * @ngdoc service
    * @name progressArcApp.Color
    * @description
    * # Color
    * Factory in the progressArcApp.
   */
  var Color;

  Color = function() {
    var getMoodColor, pallette;
    pallette = {
      red: 'rgb(255, 0, 0)',
      orange: 'rgb(255, 140, 0)',
      green: 'rgb(120, 192, 0)',
      lightGreen: 'rgba(120, 192, 0, 0.5)',
      lightGray: 'rgb(244, 244, 244)'
    };
    getMoodColor = function(actual, expected) {
      var difference;
      difference = expected - actual;
      if (difference >= 0.5) {
        return pallette.red;
      } else if (difference >= 0.25) {
        return pallette.orange;
      } else {
        return pallette.green;
      }
    };
    return {
      getMoodColor: getMoodColor,
      defaultColor: pallette.green,
      primary: pallette.green,
      secondary: pallette.lightGreen,
      base: pallette.lightGray
    };
  };

  angular.module('progressArcApp').factory('Color', Color);

}).call(this);

//# sourceMappingURL=color.js.map
