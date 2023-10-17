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
        return 0 // Handle other cases or .none
    }
}
