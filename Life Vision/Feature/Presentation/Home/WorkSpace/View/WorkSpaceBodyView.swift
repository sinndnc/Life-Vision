//
//  WorkSpaceBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceBodyView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, content: {
                let reminders = viewModel.reminders
                let selected = viewModel.selectedCategory
                let filteredReminders = viewModel.filterReminders(reminders: reminders, by: selected)
                ForEach(filteredReminders,id:\.self){ reminder in
                    WorkSpaceItemView(geo: geo,reminder: reminder)
                }
            })
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WorkSpaceBodyView(geo : geometry ,viewModel: HomeViewModel())
    })
}
