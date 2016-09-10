(function() {
  'use strict';
  describe('Controller: AboutCtrl', function() {
    var scope, vm;
    beforeEach(module('progressArcApp'));
    vm = {};
    scope = {};
    beforeEach(inject(function($controller, $rootScope) {
      scope = $rootScope.$new();
      vm = $controller('AboutCtrl', {
        $scope: scope
      });
    }));
    it('should attach a list of awesomeThings to the scope', function() {
      expect(vm.awesomeThings.length).toBe(3);
    });
  });

}).call(this);

//# sourceMappingURL=about.js.map
