//
//  BenchApp.swift
//  Bench
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI
import SwiftData

@main
struct BenchApp: App {
   
    var body: some Scene {
        WindowGroup {
            let vm = WorkoutViewModel()
            WorkOutView(viewModel: vm)
        }
    }
}
