//
//  TimelineNoonView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 4.06.2024.
//

import SwiftUI

struct TimelineNowView: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        
        let width = geo.size.width
    
        Rectangle()
            .zIndex(1)
            .foregroundStyle(.red)
            .frame(width: width,height: 0.75)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineNowView(geo: geometry)
    })
}
