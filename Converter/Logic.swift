// Logic.swift

import Foundation
//Category
enum Category: String, CaseIterable, Identifiable {
    case Distance, Temperature
    var id: Self {
        self
    }
}
//Distance
enum firstListOfValues: String, CaseIterable, Identifiable {
    case Kilometers, Meters, Centimeters, Millimeters, none
    var id: Self {
        self
    }
}
//Distance
enum secondListOfValues: String, CaseIterable, Identifiable {
    case Kilometers, Meters, Centimeters, Millimeters, none
    var id: Self {
        self
    }
}
//Temper
enum TemperatureUnitForFisrstList: String, CaseIterable, Identifiable {
    case Celsius, Fahrenheit, Kelvin, Rankine, none
    var id: Self {
        self
    }
}
//Temper
enum TemperatureUnitForSecondList: String, CaseIterable, Identifiable {
    case Celsius, Fahrenheit, Kelvin, Rankine, none
    var id: Self {
        self
    }
}



func convertValue(_ value: Double, from firstUnit: firstListOfValues, to secondUnit: secondListOfValues) -> Double {
    switch (firstUnit, secondUnit) {
    case (.Kilometers, .Kilometers):
        return value
    case (.Kilometers, .Meters):
        return value * 1000
    case (.Kilometers, .Centimeters):
        return value * 100000
    case (.Kilometers, .Millimeters):
        return value * 1000000
    case (.Meters, .Kilometers):
        return value / 1000
    case (.Meters, .Meters):
        return value
    case (.Meters, .Centimeters):
        return value * 100
    case (.Meters, .Millimeters):
        return value * 1000
    case (.Centimeters, .Kilometers):
        return value / 100000
    case (.Centimeters, .Meters):
        return value / 100
    case (.Centimeters, .Centimeters):
        return value
    case (.Centimeters, .Millimeters):
        return value * 10
    case (.Millimeters, .Kilometers):
        return value / 1000000
    case (.Millimeters, .Meters):
        return value / 1000
    case (.Millimeters, .Centimeters):
        return value / 10
    case (.Millimeters, .Millimeters):
        return value
    default:
        return 0 
    }
}

func convertTemperatureValue(_ value: Double, from firstUnit: TemperatureUnitForFisrstList, to secondUnit: TemperatureUnitForSecondList) -> Double {
    
    switch (firstUnit, secondUnit) {
    case (.Celsius, .Celsius):
        return value
    case (.Celsius, .Fahrenheit):
        return (value * 9/5) + 32
    case (.Celsius, .Kelvin):
        return value + 273.15
    case (.Celsius, .Rankine):
        return (value + 273.15) * 9/5
    case (.Fahrenheit, .Celsius):
        return (value - 32) * 5/9
    case (.Fahrenheit, .Fahrenheit):
        return value
    case (.Fahrenheit, .Kelvin):
        return (value + 459.67) * 5/9
    case (.Fahrenheit, .Rankine):
        return value + 459.67
    case (.Kelvin, .Celsius):
        return value - 273.15
    case (.Kelvin, .Fahrenheit):
        return (value * 9/5) - 459.67
    case (.Kelvin, .Kelvin):
        return value
    case (.Kelvin, .Rankine):
        return value * 1.8
    case (.Rankine, .Celsius):
        return (value - 491.67) * 5/9
    case (.Rankine, .Fahrenheit):
        return value - 459.67
    case (.Rankine, .Kelvin):
        return value * 5/9
    case (.Rankine, .Rankine):
        return value
    default:
        return 0
    }
}
