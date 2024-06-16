//
//  CountdownItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownItemView: View {
    
    var geo : GeometryProxy
    var number : Int
    
    var body: some View {
        ZStack{
            Text(String(number))
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(
            width: geo.size.width * 0.2,
            height: geo.size.height * 0.1
        )
        .background(.gray.opacity(0.25))
        .clipShape(Circle())
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownItemView(geo: geometry, number: 01)
    })
}
