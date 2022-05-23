//
//  ContentView.swift
//  SliderSwiftUI
//
//  Created by Евгения Аникина on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            SliderView(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .red,
                alpha: computerScore()
            )
            
        ButtonView(
            showAlert: $showAlert,
            title: "Проверь меня!",
            currentScore: computerScore(),
            action: { showAlert = true }
        )
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func computerScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ButtonView: View {
    
    @Binding var showAlert: Bool
    
    let title: String
    let currentScore: Int
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(currentScore)")
            }
    }
    
    init(showAlert: Binding<Bool> = .constant(false), title: String,
         currentScore: Int = 0, action: @escaping () -> Void) {
        self._showAlert = showAlert
        self.title = title
        self.currentScore = currentScore
        self.action = action
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
