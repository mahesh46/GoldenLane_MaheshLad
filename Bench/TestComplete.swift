//
//  ContentView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct TestComplete: View {
    @ObservedObject var viewModel: WorkoutViewModel
   
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Header
            Text("Today 05 October")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 20)

            // Test status
            Text("Test Complete")
                .font(.largeTitle)
                .fontWeight(.bold)

            Divider().padding(.vertical, 10)

            // Exercise section
            VStack(alignment: .leading, spacing: 8) {
                Text("Bench Press (Dumbbell)")
                    .font(.title2)
                    .fontWeight(.semibold)

                ForEach(viewModel.summarytext(), id:\.id) { item in
                    HStack {
                        Text("Set \(item.id)")
                        Spacer()
                        Text(item.kg)
                        Text("Kg")
                        Text(" x ")
                        Text(item.reps)
                        Text(" reps")

                    }
                    
                }
            
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct TestComplete_Previews: PreviewProvider {
    static var previews: some View {
        let vm = WorkoutViewModel()
        TestComplete(viewModel: vm)
    }
}


