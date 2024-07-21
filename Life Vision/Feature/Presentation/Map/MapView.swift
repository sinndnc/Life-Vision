//
//  MapView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.07.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel : MapViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Map{}
            
            HStack {
                Spacer()
                Text("test")
                Spacer()
            }
            .background(.white)
            .padding()
            .frame(width: 390,height: 100)
            
        }
    }
}

#Preview {
    MapView(viewModel: MapViewModel())
}
