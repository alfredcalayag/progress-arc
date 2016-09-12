'use strict'

describe 'Service: Conversion', ->
    # load the service's module
    beforeEach module 'progressArcApp'

    # instantiate service
    Conversion = {}
    beforeEach inject ($injector) ->
        Conversion = $injector.get 'Conversion'

    describe 'floatToRadians', ->
        it 'should convert a float decimal number to a radian value', ->
            expect(Conversion.floatToRadians 0.5).toEqual 0.5 * 2 * Math.PI

    describe 'floatToPercent', ->
        it 'should convert a float decimal to a percentage value', ->
            expect(Conversion.floatToPercent 0.55).toEqual 55

        it 'should round to the nearest whole number', ->
            expect(Conversion.floatToPercent 0.5555).toEqual 56
            expect(Conversion.floatToPercent 0.554999).toEqual 55

    describe 'isValidFloat', ->
        it 'should return true if number is between 0 and 1', ->
            expect(Conversion.isValidFloat 0).toBe true
            expect(Conversion.isValidFloat 0.1).toBe true
            expect(Conversion.isValidFloat 0.55555555).toBe true
            expect(Conversion.isValidFloat 1.0).toBe true

        it 'should return false if number is greater than 1', ->
            expect(Conversion.isValidFloat 1.1).toBe false
            expect(Conversion.isValidFloat 100).toBe false

        it 'should return false if number is the number is less than 0', ->
            expect(Conversion.isValidFloat -0.5).toBe false
            expect(Conversion.isValidFloat -1).toBe false

        it 'should return false if the input is not a number type', ->
            expect(Conversion.isValidFloat 'one').toBe false

        it 'should return false if the input is undefined', ->
            expect(Conversion.isValidFloat undefined).toBe false

        it 'should return false if the input is NaN', ->
            expect(Conversion.isValidFloat NaN).toBe false

    return