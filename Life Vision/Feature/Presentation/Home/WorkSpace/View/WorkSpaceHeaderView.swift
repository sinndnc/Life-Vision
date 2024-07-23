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
            .padding(.horizontal)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, content: {
                ForEach(ReminderCategory.allCases,id:\.self) { category in
                    WorkSpaceCategoryItemView(category: category, viewModel: viewModel)
                }
            })
            .padding()
        }
    }
}

#Preview {
    WorkSpaceHeaderView(viewModel: HomeViewModel())
}
