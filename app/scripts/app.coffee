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
      .when '/demo',
        templateUrl: 'views/demo.html'
        controller: 'DemoCtrl'
        controllerAs: 'vm'
      .when '/demo-input',
        templateUrl: 'views/demo-input.html'
        controller: 'DemoInputCtrl'
        controllerAs: 'vm'
      .when '/demo-errors',
        templateUrl: 'views/demo-errors.html'
        controller: 'DemoErrorsCtrl'
        controllerAs: 'vm'
      .otherwise
        redirectTo: '/demo-errors'
  # .factory '$exceptionHandler', ($injector) ->
  #   (exception, cause) ->
  #     $rootScope = $injector.get '$rootScope'
  #     $rootScope.errors = $rootScope.errors || []
  #     $rootScope.errors.push exception

  #     # Add error logging here
  #     console.log exception + '\nCause: ' + cause

      # For now, we can just use an alert to provide feedback to the user
      # alert 'Sorry, an error has occurred: ' + exception.message
