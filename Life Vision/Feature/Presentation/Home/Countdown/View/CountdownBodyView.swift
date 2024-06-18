//
//  CountdownBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI


struct CountdownBodyView: View {
    
    var geo : GeometryProxy
    var viewModel : HomeViewModel

    var body: some View {
        HStack(spacing: 10){
            let items = [viewModel.countdown.day,viewModel.countdown.hour,viewModel.countdown.minute,viewModel.countdown.second]
            ForEach(items, id: \.1) { value in
                CountdownItemView(geo: geo, number: value.0, type: value.1)
            }
        }
    }
    
}

#Preview {
    GeometryReader{ geo in
        CountdownBodyView(geo: geo,viewModel: HomeViewModel())
    }
}
