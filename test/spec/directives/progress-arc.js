(function() {
  'use strict';
  describe('Directive: progressArc', function() {
    var scope;
    beforeEach(module('progressArcApp'));
    scope = {};
    beforeEach(inject(function($controller, $rootScope) {
      return scope = $rootScope.$new();
    }));
    it('should make hidden element visible', inject(function($compile) {
      var element;
      element = angular.element('<progress-arc></progress-arc>');
      element = $compile(element)(scope);
      return expect(element.text()).toContain('Progress');
    }));
    return it('should accept 2 inputs \'actual\' and \'expected\'', inject(function($compile) {
      var element;
      element = angular.element('<progress-arc actual=60 expected=80></progress-arc>');
      element = $compile(element)(scope);
      return expect(element.text()).toContain('Actual: 60').and.toContain('Estimated: 80');
    }));
  });

}).call(this);

//# sourceMappingURL=progress-arc.js.map
