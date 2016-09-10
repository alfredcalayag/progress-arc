'use strict'

###*
 # @ngdoc function
 # @name progressArcApp.controller:MyTestCtrl
 # @description
 # # MyTestCtrl
 # Controller of the progressArcApp
###

MyTestCtrl = () ->
    vm = this
    vm.description = 'Back in business'
    return

MyTestCtrl.$inject = []

angular.module 'progressArcApp'
  .controller 'MyTestCtrl', MyTestCtrl
