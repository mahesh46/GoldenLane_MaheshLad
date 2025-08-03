//
//  WorkoutViewModel.swift
//  Exercise
//
//  Created by mahesh lad on 30/07/2025.
//
import Foundation
import Combine

class WorkoutViewModel: ObservableObject {
    @Published var sets: [WorkoutSet] = [
        WorkoutSet(setNumber: 1, previous: "15 x 10"),
        WorkoutSet(setNumber: 2, previous: "15 x 10"),
        WorkoutSet(setNumber: 3, previous: "15 x 10")
        ]
    @Published var currentStep: WorkoutStep = .start
    @Published var selectedSetIndex: Int? = nil
    @Published var restDuration: TimeInterval = 60
    @Published var countdownRemaining: TimeInterval = 0
    @Published var editingIndex: Int? = nil
    @Published var shouldPresentSheet = false
    var totalSets: Int {
            sets.count
        }
    
    enum WorkoutStep {
        case start, timer, input, restPicker, countdown, summary
    }
    
    func startWorkout() {
        currentStep = .timer
    }
    
    func completeSet(at index: Int) {
        sets[index].completed = true
        currentStep = .restPicker
    }
    
    func complete() {
        shouldPresentSheet.toggle()
    }

    
    func beginCountdown() {
        countdownRemaining = restDuration
        currentStep = .countdown
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.countdownRemaining > 0 {
                
                    self.countdownRemaining -= 1
                
            } else {
                timer.invalidate()
                self.currentStep = .summary
            }
        }
    }
    
    func summarytext() -> [(id: Int, kg: String, reps: String)] {
        var count = 0
        var array =  [(id: Int, kg: String, reps: String)]()
        for set in sets {
            count += 1
            array.append((count, "\(set.kg)", "\(set.reps)"))
        }
        return array
    }
}
