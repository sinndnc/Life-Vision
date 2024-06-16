//
//  LocationSuggestion.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct LocationSuggestion: View {
    
    var geo : GeometryProxy
    
    var body: some View {
        VStack{
            Image(systemName: "location.fill")
                .padding()
                .frame(width: geo.size.width * 0.2)
                .background(.red.opacity(0.2))
                .clipShape(Circle())
            Text("Create location reminder")
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        LocationSuggestion(geo: geometry)
    })
}
