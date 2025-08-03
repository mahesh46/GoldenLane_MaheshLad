//
//  RestTimerPickerView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct RestTimerPickerView: View {
    @State private var selectedRestTime: Int? = nil
    @ObservedObject var viewModel: WorkoutViewModel
    let restOptions = [30, 60, 90] // Rest time options in seconds

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 12) {
                ForEach(restOptions, id: \.self) { time in
                    Button(action: {
                        selectedRestTime = time
                        // Trigger countdown or logic here
                        viewModel.restDuration = TimeInterval(time)
                    }) {
                        Text("\(time) sec")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 4)
                            .background(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                                )
                    }
                }

                Spacer()

                Button(action: {
                  //  selectedRestTime = nil
                    // Handle finish or dismiss
                    viewModel.currentStep = .countdown
                }) {
                    Image(systemName: "checkmark")
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                }
            }
            .padding(8)
            .padding(.horizontal, 16)
            .background(Color.black)
            .cornerRadius(50)
        }
        
    }
}

struct RestTimerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WorkoutViewModel()
        RestTimerPickerView(viewModel: vm)
    }
}
