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

