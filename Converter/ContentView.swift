import SwiftUI

struct ContentView: View {

    @State private var selectedValueFirstPicker: firstListOfValues = .none
    @State private var selectedValueSecondPicker: secondListOfValues = .none
    @State private var field1: String = ""

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
