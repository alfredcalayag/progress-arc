'use strict'

###*
 # @ngdoc service
 # @name progressArcApp.Errors
 # @description
 # # Errors
 # Factory in the progressArcApp.
###
    # Service logic
    # ...
Errors = () ->
    inputTypeError = (type, input, defaultedInput, errorAllowed) ->
        message = 'Saw "' + type + '"' + ' input value: "' + input + '". ' +
            '"' + type + '"' + ' input should be a number between 0 and 1.0. ' +
            'Input has been defaulted to ' + defaultedInput + '. Please try again.'
        if errorAllowed
            # Allow widget to initialize
            console.log message
        else throw TypeError message

    return {
        inputTypeError: inputTypeError
    }

angular.module 'progressArcApp'
  .factory 'Errors', Errors
