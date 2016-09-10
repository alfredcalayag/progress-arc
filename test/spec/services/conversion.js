(function() {
  'use strict';
  describe('Service: Conversion', function() {
    var Conversion;
    beforeEach(module('progressArcApp'));
    Conversion = {};
    beforeEach(inject(function(_Conversion_) {
      return Conversion = _Conversion_;
    }));
    return it('should do something', function() {
      return expect(!!Conversion).toBe(true);
    });
  });

}).call(this);

//# sourceMappingURL=conversion.js.map
