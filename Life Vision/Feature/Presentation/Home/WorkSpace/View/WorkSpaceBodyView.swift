//
//  WorkSpaceBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceBodyView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, content: {
                let reminders = viewModel.classifiedReminders
                ForEach(viewModel.reminderRepository.filterTasks(reminders: reminders, by: viewModel.workSpaceCategorySelected),id:\.self){ reminder in
                    WorkSpaceItemView(reminder: reminder)
                }
            })
        }
    }
}

#Preview {
    WorkSpaceBodyView(viewModel: HomeViewModel())
}
