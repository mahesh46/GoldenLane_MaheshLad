//
//  NumberPadView.swift
//  input
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct NumberPadView: View {
    let keys: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "<"]
    ]
    
   // @State private var input = ""
    @Binding var input: String
    @Binding var shouldPresentSheet: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Text("\(input)")
                .foregroundColor(.white)
                .font(.title2)
            
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 16) {
                    ForEach(row, id: \.self) { key in
                        Button(action: {
                            handleKeyPress(key)
                        }) {
                            Text(key)
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(12)
                        }
                    }
                }
            }
            
            Button(action: {
                // Add your Next button logic here
                shouldPresentSheet.toggle()
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
            }
            .padding(.top, 20)
        }
        .padding(10)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .cornerRadius(12)
    }
    
    func handleKeyPress(_ key: String) {
        switch key {
        case "<":
            if !input.isEmpty {
                input.removeLast()
            }
        default:
            input.append(key)
        }
    }
}


