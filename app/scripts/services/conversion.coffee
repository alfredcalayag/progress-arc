'use strict'

###*
 # @ngdoc service
 # @name progressArcApp.Conversion
 # @description
 # # Conversion
 # Factory in the progressArcApp.
###
    # Service logic
    # ...
Conversion = () ->
    floatToRadians = (percent) ->
        percent * 360 * Math.PI / 180

    floatToPercent = (float) ->
        float * 100

    return {
        floatToRadians: floatToRadians
        floatToPercent: floatToPercent
    }

angular.module 'progressArcApp'
  .factory 'Conversion', Conversion
