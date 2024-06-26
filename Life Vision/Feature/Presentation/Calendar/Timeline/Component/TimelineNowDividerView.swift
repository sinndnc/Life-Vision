//
//  TimelineNoonView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 4.06.2024.
//

import SwiftUI

struct TimelineNowDividerView: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        
        let width = geo.size.width
    
        Rectangle()
            .zIndex(2)
            .foregroundStyle(.red)
            .frame(width: width,height: 0.75)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineNowDividerView(geo: geometry)
    })
}
