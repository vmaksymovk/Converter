import SwiftUI

struct ContentView: View {
    //Distance
    @State private var selectedValueFirstPicker: firstListOfValues = .none
    @State private var selectedValueSecondPicker: secondListOfValues = .none
    //Tempeture
    @State private var selectedTempetureFirstPicker: TemperatureUnitForFisrstList = .none
    @State private var selectedTempetureSecondPicker: TemperatureUnitForSecondList = .none
    
    @State private var field1: String = ""
    @State private var chooseCategory : Category = .Distance

    @State private var isShowingError = false
    @State private var errorMessage = ""

    var convertedValue: Double? {
        if field1.isEmpty {
            return nil
        }

        if let fieldValue = Double(field1) {
            return convertValue(fieldValue, from: selectedValueFirstPicker, to: selectedValueSecondPicker)
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
                    
                    if (chooseCategory == .Distance){
                        
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
                        TextField("Enter your value", text: $field1)
                            .keyboardType(.decimalPad)
                        
                    }
                    else {
                        Picker("From:", selection: $selectedTempetureFirstPicker) {
                            ForEach(TemperatureUnitForFisrstList.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                        Picker("To:", selection: $selectedTempetureSecondPicker) {
                            ForEach(TemperatureUnitForSecondList.allCases) { value in
                                Text(value.rawValue).tag(value)
                            }
                        }
                        TextField("Enter your value", text: $field1)
                            .keyboardType(.decimalPad)
                    }
                }// end first section
                Section(header: Text("Result").font(.title).bold()) {
                    if let convertedValue = convertedValue {
                        Text("\(field1) \(selectedValueFirstPicker.rawValue) = \(convertedValue, specifier: "%.2f") \(selectedValueSecondPicker.rawValue)")
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
