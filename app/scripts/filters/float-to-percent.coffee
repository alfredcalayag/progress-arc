'use strict'

###*
 # @ngdoc filter
 # @name progressArcApp.filter:floatToPercent
 # @function
 # @description
 # # floatToPercent
 # Filter in the progressArcApp.
###
floatToPercent = (float) ->
    (float * 100) + '%'

angular.module 'progressArcApp'
    .filter 'floatToPercent', floatToPercent
