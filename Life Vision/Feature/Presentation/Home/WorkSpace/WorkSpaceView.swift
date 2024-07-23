//
//  WorkSpaceView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceView: View {
 
    var geo : GeometryProxy
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.red, .teal, .blue, .black, .indigo, .red],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .blur(radius: 30,opaque: true)
            VStack(alignment: .leading,spacing: 10,content: {
                WorkSpaceHeaderView(viewModel: viewModel)
                WorkSpaceBodyView(geo: geo,viewModel: viewModel)
            })
            .padding(.vertical)

        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    GeometryReader { geometry in
        WorkSpaceView(geo: geometry, viewModel: HomeViewModel())
    }
}
