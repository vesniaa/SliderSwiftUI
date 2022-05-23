//
//  SliderView.swift
//  SliderSwiftUI
//
//  Created by Евгения Аникина on 23.05.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                CustomSlider(value: $currentValue, alpha: alpha, color: color)
                Text("100")
            }
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), targetValue: 50, color: .red, alpha: 100)
    }
}
