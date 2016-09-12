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
    return $routeProvider.when('/', {
      templateUrl: 'views/main.html'
    }).when('/about', {
      templateUrl: 'views/about.html',
      controller: 'AboutCtrl',
      controllerAs: 'about'
    }).when('/demo', {
      templateUrl: 'views/demo.html'
    }).otherwise({
      redirectTo: '/'
    });
  }).factory('$exceptionHandler', function($injector) {
    return function(exception, cause) {
      var $rootScope;
      $rootScope = $injector.get('$rootScope');
      $rootScope.errors = $rootScope.errors || [];
      $rootScope.errors.push(exception);
      console.log(exception + '\nCause: ' + cause);
      return alert('Sorry, an error has occurred: ' + exception.message);
    };
  });

}).call(this);

//# sourceMappingURL=app.js.map
