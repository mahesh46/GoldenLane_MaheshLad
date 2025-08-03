//
//  TimerView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    @State private var timerValue: Int = 0
    @State private var timer: Timer? = nil
    @State private var timerRunning = false
   
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                // Finish button (Stop)
                Button(action: stopTimer) {
                    Text("Finish")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(25)
                }

                Spacer()

                // Timer label
                Text(timeString)
                    .font(.title)
                    .foregroundColor(.white)

                Spacer()

                // Start button (Timer icon)
                Button(action: startTimer) {
                    Image(systemName: "timer")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(25)
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(50)
        }
    }

    var timeString: String {
        let minutes = timerValue / 60
        let seconds = timerValue % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    func startTimer() {
        guard !timerRunning else { return }
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timerValue += 1
        }
    }

    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil

        viewModel.currentStep = .restPicker
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WorkoutViewModel()
        TimerView(viewModel: viewModel)
    }
}
