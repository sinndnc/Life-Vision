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
        }
    }
}

#Preview {
    MapView(viewModel: MapViewModel())
}
