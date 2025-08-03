//
//  ContentView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct WorkoutSet: Identifiable {
    let id = UUID()
    let setNumber: Int
    let previous: String
    var kg: String = ""
    var reps: String = ""
    var completed: Bool = false
}

struct WorkOutView: View {

    @ObservedObject var viewModel: WorkoutViewModel
 
    @FocusState var isInputActive: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Bench Press (Dumbbell)")
                .font(.title2)
                .bold()
                .padding(.top)
            
            headerRow
            
            ForEach($viewModel.sets) { $set in
                HStack {
                    Text("Set \(set.setNumber)")
                        .frame(width: 60, alignment: .leading)
                    
                    Text(set.previous)
                        .frame(width: 80, alignment: .center)
                        .foregroundColor(.gray)
                    
                    TextField("Kg", text: $set.kg)
                        .keyboardType(.decimalPad)
                        .frame(width: 50, height:30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($isInputActive)
                    
                    
                    TextField("Reps", text: $set.reps)
                        .keyboardType(.numberPad)
                        .frame(width: 50, height:30)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($isInputActive)
                    
                    
                    Toggle(isOn: $set.completed) {
                        EmptyView()
                    }
                    .toggleStyle(.checkbox)
                    .frame(width: 30)
                }
                .padding(.horizontal)
            }
            Spacer()
            instructions
            Spacer()
            
            PillButton(viewModel: viewModel)
        
        }
        .padding()
        .background(Color(UIColor.systemGray6))
//        .cornerRadius(20) /// make the background rounded
//        .overlay( /// apply a rounded border
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(.blue, lineWidth: 5)
//        )
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
            Spacer()

            Button("Done") {
            isInputActive = false
                 }
                }
            }
        .sheet(isPresented: $viewModel.shouldPresentSheet) {
            print("Sheet dismissed!")
        } content: {
            TestComplete(viewModel: viewModel)
        }
    }
      
    var instructions: some View {
        Text("Mark all completed to view summary")
            .font(.headline)
            .foregroundColor(.secondary)
            .padding(.horizontal)
    }
    
    var headerRow: some View {
        HStack {
            Text("Set")
                .frame(width: 60, alignment: .leading)
            Text("Previous")
                .frame(width: 80, alignment: .center)
            Text("Kg")
                .frame(width: 50)
            Text("Reps")
                .frame(width: 50)
            Text("✓")
                .frame(width: 30)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding(.horizontal)
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static var checkbox: CheckboxToggleStyle {
        CheckboxToggleStyle()
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .foregroundColor(configuration.isOn ? .blue : .gray)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

#Preview {
    let vm = WorkoutViewModel()
    WorkOutView(viewModel: vm)
}
