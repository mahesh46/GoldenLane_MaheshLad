//
//  CountdownView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct CountdownView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @State private var timeRemaining: Int = 60
    @State private var timer: Timer? = nil
    

    var body: some View {
        VStack {
            Spacer()

            HStack {
                // Left: Timer label
                Text(timeString(from: timeRemaining))
                   // .padding()
                    .frame(maxWidth: 90, maxHeight: 40)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2)
                        )
                    

                // Middle: ProgressView draining from full to empty
                ProgressView(value: Double(timeRemaining), total: 90)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(height: 10)
                   // .padding(.horizontal)
                    .background(Color.gray)
                    .tint(.blue)
                    .cornerRadius(10)

                // Right: Finish button with black background
                Button(action: stopTimer) {
                    Text("Skip")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.white)
                        .cornerRadius(8)
                       // .border(.white, width: 2)
                        .cornerRadius(20)
                }
                .padding(.trailing)
            }
           .padding()
           // .background(Color(.systemGray6))
            .background(Color(.black))
            .cornerRadius(30)
           // .padding(.bottom, 16)
        }
        .onAppear {
            timeRemaining = Int(viewModel.restDuration)
            startTimer()
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        let completedSets = viewModel.sets.filter { $0.completed }
        
        if completedSets.count < 3 {
            viewModel.currentStep = .timer
        } else {
            viewModel.currentStep = .summary
        }
    }

    func timeString(from seconds: Int) -> String {
        let min = seconds / 60
        let sec = seconds % 60
        return String(format: "%02d:%02d", min, sec)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WorkoutViewModel()
        CountdownView(viewModel: vm)
    }
}
