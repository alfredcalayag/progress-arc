'use strict'

###*
 # @ngdoc service
 # @name progressArcApp.Color
 # @description
 # # Color
 # Factory in the progressArcApp.
###
    # Service logic

Color = () ->
    pallette = {
        red: 'rgb(255, 0, 0)'
        orange: 'rgb(255, 140, 0)'
        green: 'rgb(120, 192, 0)'
        lightGreen: 'rgba(120, 192, 0, 0.5)'
        lightGray: 'rgb(244, 244, 244)'
    }

    getMoodColor = (actual, expected) ->
        difference = expected - actual
        if difference >= 0.5 then pallette.red
        else if difference >= 0.25 then pallette.orange
        else pallette.green

    return {
        getMoodColor: getMoodColor
        defaultColor: pallette.green
        primary: pallette.green
        secondary: pallette.lightGreen
        base: pallette.lightGray
    }

angular.module 'progressArcApp'
  .factory 'Color', Color
