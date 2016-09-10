(function() {
  'use strict';
  describe('Controller: ProgressArcCtrl', function() {
    var scope, vm;
    beforeEach(module('progressArcApp'));
    vm = {};
    scope = {};
    beforeEach(inject(function($controller, $rootScope) {
      scope = $rootScope.$new();
      vm = $controller('ProgressArcCtrl', {});
    }));
    it('should contain a title property', function() {
      expect(vm).toEqual(jasmine.objectContaining({
        title: 'Progress'
      }));
    });
    it('should contain an \'actual property whose value is a Number', function() {
      expect(vm.actual).toEqual(jasmine.any(Number));
    });
    it('should contain an \'expected property whose value is a Number', function() {
      expect(vm.expected).toEqual(jasmine.any(Number));
    });
  });

}).call(this);

//# sourceMappingURL=progress-arc.js.map
