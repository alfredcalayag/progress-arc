'use strict'

###*
 # @ngdoc overview
 # @name progressArcApp
 # @description
 # # progressArcApp
 #
 # Main module of the application.
###
angular
  .module 'progressArcApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .when '/demo',
        templateUrl: 'views/demo.html'
      .otherwise
        redirectTo: '/'
  .factory '$exceptionHandler', ($injector) ->
    (exception, cause) ->
      $rootScope = $injector.get '$rootScope'
      $rootScope.errors = $rootScope.errors || []
      $rootScope.errors.push exception

      # Add error logging here
      console.log exception + '\nCause: ' + cause

      # For now, we can just use an alert to provide feedback to the user
      alert 'Sorry, an error has occurred: ' + exception.message
