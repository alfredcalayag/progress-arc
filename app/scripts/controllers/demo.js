(function() {
  'use strict';

  /**
    * @ngdoc function
    * @name progressArcApp.controller:DemoCtrl
    * @description
    * # DemoCtrl
    * Controller of the progressArcApp
   */
  var DemoCtrl;

  DemoCtrl = function() {
    var vm;
    vm = this;
    vm.data = [
      {
        actual: 0.9,
        expected: 0.7,
        radius: 100
      }, {
        actual: 0.52,
        expected: 0.78,
        radius: 100
      }, {
        actual: 0.13,
        expected: 0.65,
        radius: 100
      }
    ];
  };

  angular.module('progressArcApp').controller('DemoCtrl', DemoCtrl);

}).call(this);

//# sourceMappingURL=demo.js.map
