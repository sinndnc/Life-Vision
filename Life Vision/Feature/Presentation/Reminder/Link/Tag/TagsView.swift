//
//  TagsView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct TagsView: View {
    
    @Binding var path : [ReminderDestination]
    @StateObject var viewModel : ReminderViewModel
    
    
    var body: some View {
        List {
            Section {
                HStack{
                    TagItemView()
                    Spacer()
                }
            }
            Section{
                TextField("Add new Tag", text: $viewModel.tagTextfield)
            }
        }
        .localizedNavigationTitle(title: "Tags")
    }
}

#Preview {
    TagsView(path: .constant([]), viewModel: ReminderViewModel())
}
