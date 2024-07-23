//
//  WorkSpaceCategoryItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceCategoryItemView: View {

    var category : ReminderCategory
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        
        let isSelected = viewModel.selectedCategory == category
        
        Button(action: {
            viewModel.selectedCategory = category
        }, label: {
            Text("\(category)".capitalized)
                .padding(3)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .background(isSelected ? .white.opacity(0.35) : .clear)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        })
        .padding(5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WorkSpaceCategoryItemView(category: .today, viewModel: HomeViewModel())
}
