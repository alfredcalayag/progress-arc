'use strict'

###*
 # @ngdoc function
 # @name progressArcApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the progressArcApp
###


AboutCtrl = () ->
    vm = this
    vm.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    return

AboutCtrl.$inject = []

angular.module 'progressArcApp'
  .controller 'AboutCtrl', AboutCtrl
