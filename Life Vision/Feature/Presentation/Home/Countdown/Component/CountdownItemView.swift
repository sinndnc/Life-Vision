//
//  CountdownItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownItemView: View {
    
    var geo : GeometryProxy
    var value : Int?
    var maxItemValue : Int
    
    var body: some View {
        ZStack{
            CircularProgressView(progress: mapToPercentage(value: Double(value ?? 0), maxValue:Double(maxItemValue)))
            Text(String(format:"%0.2d",Int(value ?? 0)))
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(
            width: geo.size.width * 0.2,
            height: geo.size.height * 0.1
        )
        .background(.black.opacity(0.1))
        .clipShape(Circle())
    }
    
    
    func mapToPercentage(value: Double, minValue: Double = 0.0, maxValue: Double) -> Double {
        // Ensure the value is within the range
        let clampedValue = max(min(value, maxValue), minValue)
        
        // Calculate the percentage
        let percentage = (clampedValue - minValue) / (maxValue - minValue)
        return percentage
    }
    
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownItemView(geo: geometry, value: 01, maxItemValue: 23)
    })
}
