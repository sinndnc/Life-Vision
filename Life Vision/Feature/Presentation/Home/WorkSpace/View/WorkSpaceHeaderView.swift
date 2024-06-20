//
//  WorkSpaceHeaderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceHeaderView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        Text("My Workspace")
            .font(.title3)
            .fontWeight(.semibold)
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, content: {
                ForEach(viewModel.workSpaceCategories,id:\.self) { category in
                    WorkSpaceCategoryItemView(category: category, viewModel: viewModel)
                }
            })
        }

    }
}

#Preview {
    WorkSpaceHeaderView(viewModel: HomeViewModel())
}
