import SwiftUI

struct ContentView: View {
    // Distance
    @State private var selectedValueFirstPicker: firstListOfValues = .none
    @State private var selectedValueSecondPicker: secondListOfValues = .none
    // Temperature
    @State private var selectedTemperatureFirstPicker: TemperatureUnitForFisrstList = .none
    @State private var selectedTemperatureSecondPicker: TemperatureUnitForSecondList = .none

    @State private var field1: String = ""
    @State private var chooseCategory: Category = .Distance

    @State private var isShowingError = false
    @State private var errorMessage = ""

    var convertedValue: Double? {
        if field1.isEmpty {
            return nil
        }

        if let fieldValue = Double(field1) {
            if chooseCategory == .Distance {
                return convertValue(fieldValue, from: selectedValueFirstPicker, to: selectedValueSecondPicker)
            } else {
                return convertTemperatureValue(fieldValue, from: selectedTemperatureFirstPicker, to: selectedTemperatureSecondPicker)
            }
        } else {
            return nil
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Converter").font(.largeTitle).bold()) {
                    Picker("Category:", selection: $chooseCategory) {
                        ForEach(Category.allCases) { value in
                            Text(value.rawValue).tag(value)
                        }
                    }

                    if chooseCategory == .Distance {
                        Picker("From:", selection: $selectedValueFirstPicker) {
                            ForEach(firstListOfValues.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                        Picker("To:", selection: $selectedValueSecondPicker) {
                            ForEach(secondListOfValues.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                    } else {
                        Picker("From:", selection: $selectedTemperatureFirstPicker) {
                            ForEach(TemperatureUnitForFisrstList.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                        Picker("To:", selection: $selectedTemperatureSecondPicker) {
                            ForEach(TemperatureUnitForSecondList.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                    }

                    TextField("Enter your value", text: $field1)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Result").font(.title).bold()) {
                    if let convertedValue = convertedValue {
                        Text("\(field1) \(chooseCategory == .Distance ? selectedValueFirstPicker.rawValue : selectedTemperatureFirstPicker.rawValue) = \(convertedValue, specifier: "%.2f") \(chooseCategory == .Distance ? selectedValueSecondPicker.rawValue : selectedTemperatureSecondPicker.rawValue)")
                    } else if !field1.isEmpty {
                        Text("Invalid input. Please enter a valid number.")
                    }
                }
            }
        }
        .alert(isPresented: $isShowingError) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        .onChange(of: field1) { newValue in
            if newValue.isEmpty {
                isShowingError = false
            } else if Double(newValue) != nil {
                isShowingError = false
            } else {
                isShowingError = true
                errorMessage = "Invalid input. Please enter a valid number."
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
