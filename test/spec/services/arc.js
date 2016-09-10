(function() {
  'use strict';
  describe('Service: Arc', function() {
    var Arc;
    beforeEach(module('progressArcApp'));
    Arc = {};
    beforeEach(inject(function(_Arc_) {
      return Arc = _Arc_;
    }));
    return it('should do something', function() {
      return expect(!!Arc).toBe(true);
    });
  });

}).call(this);

//# sourceMappingURL=arc.js.map
