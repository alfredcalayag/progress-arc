(function() {
  'use strict';
  describe('Service: Color', function() {
    var Color;
    beforeEach(module('progressArcApp'));
    Color = {};
    beforeEach(inject(function(_Color_) {
      return Color = _Color_;
    }));
    return it('should do something', function() {
      return expect(!!Color).toBe(true);
    });
  });

}).call(this);

//# sourceMappingURL=color.js.map
