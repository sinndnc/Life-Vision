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
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(color)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .square, lineJoin: .bevel))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
        }
    }
}
#Preview {
    CircularProgressView(progress: 0.5)
}
