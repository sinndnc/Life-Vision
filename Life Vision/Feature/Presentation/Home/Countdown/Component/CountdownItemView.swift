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
    var type : String
    
    var body: some View {
        VStack{
            ZStack{
                Text(String(format: "%0.2d",number))
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(
                width: geo.size.width * 0.2,
                height: geo.size.height * 0.1
            )
            .background(.gray.opacity(0.25))
            .clipShape(Circle())
            
            Text(type)
                .font(.footnote)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownItemView(geo: geometry, number: 01,type: "hour")
    })
}
