//
//  NotificationView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject var viewModel : AccountViewModel

    var body: some View {
        List($viewModel.categories, id: \.self) { $category in
            Section(header: Text(category.name)) {
                Toggle(isOn: self.bindingForCategory(category)) {
                    Text("Allow")
                }
                ForEach($category.subCategories,id:\.self) { $subCategory in
                    Toggle(isOn: self.bindingForSubCategory(category,subCategory)) {
                        Text(subCategory.name)
                    }
                    .disabled(!category.isAllowed)
                }
            }
        }
        .localizedNavigationTitle(title: "Notifications")
    }

    func bindingForCategory(_ category: CategoryItem) -> Binding<Bool> {
        Binding {
            return category.isAllowed
        } set: { newValue in
            withAnimation(.spring) {
                if let index = viewModel.categories.firstIndex(of: category){
                    viewModel.categories[index].isAllowed = newValue
                    viewModel.saveCategories()
                }
            }
        }
    }  
    
    func bindingForSubCategory(_ category: CategoryItem,_ subCategory : SubCategoryItem) -> Binding<Bool> {
        Binding {
            return subCategory.isAllowed
        } set: { newValue in
            withAnimation(.spring) {
                if let index = viewModel.categories.firstIndex(of: category){
                    if let subIndex = viewModel.categories[index].subCategories.firstIndex(of: subCategory) {
                        viewModel.categories[index].subCategories[subIndex].isAllowed = newValue
                        viewModel.saveCategories()
                    }
                }
            }
        }
    }
}

#Preview {
    NotificationView(viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
