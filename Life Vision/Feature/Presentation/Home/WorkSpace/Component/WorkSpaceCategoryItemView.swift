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
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.black)
        })
        .padding(5)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1.5)
        }
        .background(isSelected ? .gray.opacity(0.2) : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

#Preview {
    WorkSpaceCategoryItemView(category: .today, viewModel: HomeViewModel())
}
