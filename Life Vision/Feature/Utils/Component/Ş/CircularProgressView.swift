//
//  CircularProgressBar.swift
//  Life Vision
//
//  Created by Sinan Dinç on 22.06.2024.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Double // Value between 0.0 and 1.0
    var lineWidth: CGFloat = 10
    var color: Color = .blue
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                    lineWidth: 7
                )
                .shadow(color: .purple, radius: 10)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}
#Preview {
    CircularProgressView(progress: 0.5)
}
