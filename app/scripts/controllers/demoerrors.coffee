'use strict'

###*
 # @ngdoc function
 # @name progressArcApp.controller:DemoErrorsCtrl
 # @description
 # # DemoErrorsCtrl
 # Controller of the progressArcApp
###
DemoErrorsCtrl = () ->
    vm = this
    vm.data1 = {
        actual: 'foo'
        expected: 'bar'
        radius: 100
    }
    vm.data2 = {
        actual: -3
        expected: 100
        radius: 100
    }
    vm.data3 = {
        actual: "0.2"
        expected: "0.5"
        radius: 100
    }
    vm.data4 = {
        actual: "foo"
        expected: "bar"
        radius: 100
    }
    return

angular.module 'progressArcApp'
  .controller 'DemoErrorsCtrl', DemoErrorsCtrl