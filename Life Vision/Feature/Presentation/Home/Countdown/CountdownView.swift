//
//  CountdownView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import SwiftUI

struct CountdownView: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        
        VStack{
            HStack(content: {
                VStack(alignment: .leading){
                    Text("Countdown to:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Plant the there")
                }
                Spacer()

            })
            HStack(spacing: 10){
                ForEach(1...4,id: \.self){ numbers in
                    ZStack{
                        Text(String(numbers))
                    }
                    .frame(
                        width: geo.size.width * 0.2,
                        height: geo.size.height * 0.1
                    )
                    .background(.gray.opacity(0.25))
                    .clipShape(Circle())
                }
            }
            HStack(content: {
                Spacer()
                Text("after")
            })
        }
        .padding()
        .frame(
            width: geo.size.width,
            height: geo.size.height * 0.3
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownView(geo: geometry)
    })
}
