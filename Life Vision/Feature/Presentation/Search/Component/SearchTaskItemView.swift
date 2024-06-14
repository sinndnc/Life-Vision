//
//  SearchTaskItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 14.06.2024.
//

import SwiftUI

struct SearchTaskItemView: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading){
                Text("plant the tree")
                Text("don't forget plase so important for me")
            }
            Spacer()
            Text("10:30 PM")
                .font(.footnote)
        }
        .frame(height: geo.size.height * 0.075 )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        SearchTaskItemView(geo:geometry)
    })
}
