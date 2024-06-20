//
//  WorkSpaceView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceView: View {
 
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10,content: {
            WorkSpaceHeaderView(viewModel: viewModel)
            WorkSpaceBodyView(viewModel: viewModel)
        })
        .padding(.vertical)
    }
}

#Preview {
    WorkSpaceView(viewModel: HomeViewModel())
}
