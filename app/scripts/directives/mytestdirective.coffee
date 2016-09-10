'use strict'

###*
 # @ngdoc directive
 # @name progressArcApp.directive:myTestDirective
 # @description
 # # myTestDirective
###

myTestDirective = () ->
    restrict: 'E'
    templateUrl: 'views/templates/mytestdirective.html'
    bindToController: true
    controller: 'MyTestCtrl'
    controllerAs: 'vm'

myTestDirective.$inject = []

angular.module 'progressArcApp'
    .directive 'myTestDirective', myTestDirective