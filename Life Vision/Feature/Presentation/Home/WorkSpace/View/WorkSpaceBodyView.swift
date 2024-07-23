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
            VStack(
                alignment: .center,
                content: {
                    let reminders = viewModel.reminders
                    let selected = viewModel.selectedCategory
                    let filteredReminders = viewModel.filterReminders(reminders: reminders, by: selected)
                    if !filteredReminders.isEmpty {
                        ForEach(filteredReminders,id:\.self){ reminder in
                            WorkSpaceItemView(geo: geo,reminder: reminder)
                                .padding(.horizontal)
                        }
                    }else{
                        noTaskView(selected: selected)
                    }
                }
            )
        }
    }
    
    @ViewBuilder
    func noTaskView(selected : ReminderCategory) -> some View {
        VStack {
            Text("No task for \(selected.rawValue)")
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal)
        .frame(
            width: geo.size.width,
            height: geo.size.height * 0.5
        )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        WorkSpaceBodyView(geo : geometry ,viewModel: HomeViewModel())
    })
}
