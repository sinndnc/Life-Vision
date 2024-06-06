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
        
        HStack(spacing: 0){
            Text("now")
                .font(.caption2)
                .foregroundStyle(.red)
                .padding(.horizontal,5)
                .frame(width: width * 0.2,alignment: .trailing)
            VStack{
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: width,height: 2)
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineNowView(geo: geometry)
    })
}
