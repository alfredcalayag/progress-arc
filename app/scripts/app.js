(function() {
  'use strict';

  /**
    * @ngdoc overview
    * @name progressArcApp
    * @description
    * # progressArcApp
    *
    * Main module of the application.
   */
  angular.module('progressArcApp', ['ngAnimate', 'ngAria', 'ngCookies', 'ngResource', 'ngRoute', 'ngSanitize']).config(function($routeProvider) {
    return $routeProvider.when('/demo', {
      templateUrl: 'views/demo.html',
      controller: 'DemoCtrl',
      controllerAs: 'vm'
    }).otherwise({
      redirectTo: '/demo'
    });
  });

}).call(this);

//# sourceMappingURL=app.js.map
