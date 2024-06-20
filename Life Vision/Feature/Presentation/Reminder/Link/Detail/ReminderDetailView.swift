//
//  ReminderDetailView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 20.06.2024.
//

import SwiftUI

struct ReminderDetailView: View {
    
    @StateObject var viewModel : ReminderViewModel

    var body: some View {
        List {
            Section{
                TitleItemView(text: $viewModel.reminder.title, placeholder: "Title")
                TitleItemView(text: $viewModel.reminder.notes, placeholder: "Notes")
            }
            Section{
                ToggleDisclosureGroupView(item: ReminderSectionConstant.date){
                    DatePicker(
                        "Start date:",
                        selection: $viewModel.reminder.start_date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    DatePicker(
                        "Finish date:",
                        selection: $viewModel.reminder.finish_date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                }
                ToggleDisclosureGroupView(item: ReminderSectionConstant.time){
                    VStack{
                        DatePicker(
                            "Start time:",
                            selection: $viewModel.reminder.start_date,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(.compact)
                        DatePicker(
                            "Finish time:",
                            selection: $viewModel.reminder.finish_date,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(.compact)
                    }
                }
            }
            Section {
                MenuItemView(
                    menu: viewModel.earlyReminders,
                    item: ReminderSectionConstant.EarlyReminder,
                    selected: $viewModel.reminder.early_reminder
                )
                NavigationLinkDestinationView(
                    item: ReminderSectionConstant.repeat,
                    selected: viewModel.reminder.repeat,
                    content: {
                        RepeatView(viewModel: viewModel)
                    }
                )
            }
            Section{
                NavigationLinkDestinationView(
                    item: ReminderSectionConstant.tag,
                    selected: "0 selected",
                    content: {
                        TagsView(viewModel: viewModel)
                    }
                )
            }
            Section {
                ToggleDisclosureGroupView(item: ReminderSectionConstant.location) {
                    Image(systemName: "location")
                        .frame(width: 50,height: 50)
                        .background(.gray.opacity(0.3))
                        .clipShape(Circle())
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .localizedNavigationTitle(title: "Details")
    }
}

#Preview {
    ReminderDetailView(viewModel: ReminderViewModel(reminder: Reminder()))
}
