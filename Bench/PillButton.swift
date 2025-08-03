//
//  PillButton.swift
//  Exercise
//
//  Created by mahesh lad on 30/07/2025.
//
import SwiftUI

struct PillButton: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @State var shouldPresentSheet = false
  
    var body: some View {
        VStack {
            switch viewModel.currentStep {
            case .start:
                pill("Start") { viewModel.startWorkout() }
            case .timer:
                TimerView(viewModel: viewModel)
               
            case .input:
                pill("Enter Set") { viewModel.currentStep = .restPicker }
            case .restPicker:
                RestTimerPickerView(viewModel: viewModel)
            case .countdown:
                
                CountdownView(viewModel: viewModel)
            case .summary:
                pill("Done") { /* Finish logic */
                    shouldPresentSheet.toggle()
                }
            }
        }
        
        .sheet(isPresented: $shouldPresentSheet) {
            print("Sheet dismissed!")
        } content: {
            TestComplete(viewModel:viewModel)
        }
    
    }
    
    func pill(_ title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .clipShape(Capsule())
              
        }
        .padding(.horizontal)
    }
}
