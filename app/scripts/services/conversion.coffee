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
        Math.round (float * 100)

    isValidFloat = (input) ->
        input >= 0 and input <= 1

    return {
        floatToRadians: floatToRadians
        floatToPercent: floatToPercent
        isValidFloat: isValidFloat
    }

angular.module 'progressArcApp'
  .factory 'Conversion', Conversion
