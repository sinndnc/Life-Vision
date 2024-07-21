//
//  SplashView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.07.2024.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var viewModel : RootViewModel
    
    var body: some View {
        RootView(viewModel: viewModel)
    }
}

#Preview {
    SplashView()
}
