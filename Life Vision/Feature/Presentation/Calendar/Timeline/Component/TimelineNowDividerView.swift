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
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: .now)
        let minute = calendar.component(.minute, from: .now)
        
        let width = geo.size.width

        HStack{
            Text("\(hour):\(minute)")
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal,5)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            Rectangle()
                .foregroundStyle(.red)
        }
        .padding(.leading,5)
        .frame(width: width,height: 0.75)
        .zIndex(2)

    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineNowDividerView(geo: geometry)
    })
}
