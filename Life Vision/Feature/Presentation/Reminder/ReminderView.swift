//
//  ReminderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ReminderView: View {
    
    @StateObject var viewModel : ReminderViewModel
    @State private var path : [ReminderDestination] = []

    var body: some View {
        NavigationStack(path: $path){
            List {
                Section{
                    TitleItemView(text: $viewModel.reminder.title, placeholder: "Title")
                    TitleItemView(text: $viewModel.reminder.notes, placeholder: "Notes")
                }
                Section{
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.date){
                        DatePicker(
                            "Date",
                            selection: $viewModel.reminder.start_date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.time){
                        DatePicker(
                            "Time",
                            selection: $viewModel.reminder.start_date,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(.wheel)
                    }
                }
                Section {
                    MenuItemView(
                        menu: viewModel.earlyReminders,
                        item: ReminderSectionConstant.EarlyReminder,
                        selected: $viewModel.reminder.early_reminder
                    )
                    NavigationLinkItemView(
                        item: ReminderSectionConstant.repeat,
                        value: ReminderDestination.repeat,
                        selected: viewModel.reminder.repeat
                    )
                }
                Section{
                    NavigationLinkItemView(
                        item: ReminderSectionConstant.tag,
                        value: ReminderDestination.tags,
                        selected: "0 selected"
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
            .toolbar(viewModel: viewModel)
            .navigationBarTitleDisplayMode(.inline)
            .localizedNavigationTitle(title: "Details")
            .navigationGraph(path: $path, viewModel: viewModel)
        }
    }
}

fileprivate extension View{
    
    func navigationGraph(path : Binding<[ReminderDestination]>,viewModel: ReminderViewModel) -> some View {
        return navigationDestination(for: ReminderDestination.self) { destination in
            switch destination {
            case .repeat:
                RepeatView(path: path,viewModel: viewModel)
            case .tags:
                TagsView(path: path,viewModel: viewModel)
            }
        }
    }
    
    func toolbar(viewModel: ReminderViewModel) -> some View {
        return toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    viewModel.isPresented.toggle()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    viewModel.isPresented.toggle()
                    viewModel.reminder.start_date = Calendar.current.date(byAdding: .hour, value: 1, to: .now)!
                    viewModel.reminder.finish_date = Calendar.current.date(byAdding: .hour, value: 2, to: .now)!
                    viewModel.add(viewModel.reminder)
                }
            }
        }
    }
    
}

#Preview {
    ReminderView(viewModel: ReminderViewModel())
}
