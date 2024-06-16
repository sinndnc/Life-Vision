//
//  CountdownView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import SwiftUI

struct CountdownView: View {
    
    var geo : GeometryProxy
    var viewModel : HomeViewModel
    
    var body: some View {
        
        VStack{
            CountdownHeaderView(title: "viewModel.countdown.")
            CountdownBodyView(geo: geo, countdown: viewModel.countdown)
            CountdownBottomView()
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
        CountdownView(geo: geometry,viewModel: HomeViewModel())
    })
}
