//
//  TagsView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct TagsView: View {
    
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
    TagsView(viewModel: ReminderViewModel(reminder: Reminder()))
}
