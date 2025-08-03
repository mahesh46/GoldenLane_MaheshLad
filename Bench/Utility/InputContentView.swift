//
//  ContentView.swift
//  Bench
//
//  Created by mahesh lad on 02/08/2025.
//

import SwiftUI

struct InputContentView: View {
    @State private var numberInput = ""
    @State var shouldPresentSheet = false
    var body: some View {
        VStack {
//            Text("\(numberInput)")
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.black)
//                .cornerRadius(20)
//                .frame(width :90, height: 30)
            Button(action: {
            print("kg")
                shouldPresentSheet.toggle()
            }) {
            Text("\(numberInput)")
            .font(.system(size: 14))
            .frame(width: 60, height: 20)
            .padding()
            .foregroundColor(.black)
            .background(Color.gray)
            .cornerRadius(5)
            .padding(.horizontal, 10)
            }
            Spacer()
            
        }
        
        .sheet(isPresented: $shouldPresentSheet) {
            print("Sheet dismissed!")
        } content: {
            NumberPadView(input: $numberInput, shouldPresentSheet: $shouldPresentSheet)
               // .presentationDetents([.medium])
                .presentationDetents([.height(500)])
        }
      
    }
}

#Preview {
    InputContentView()
}
