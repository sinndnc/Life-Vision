//
//  TimelineDividerView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import SwiftUI

struct TimelineDividerView: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        let width = geo.size.width * 0.8
        let height = geo.size.height * 0.1

        VStack(spacing: 0){
            ForEach(0...24,id: \.self){ index in
                ZStack{
                    Rectangle()
                        .frame(height: 1)
                        .padding(.horizontal,-3)
                        .foregroundStyle(.gray.opacity(0.2))
                }
                .id(index)
                .frame(width: width,height: height,alignment: .top)
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineDividerView(geo: geometry)
    })
}
