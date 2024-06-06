//
//  ReminderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ReminderView: View {
    
    private let reminders : [String] = ["1 hour","2 hours","1 day","2 days","1 week","2 weeks"]
    @StateObject var viewModel : ReminderViewModel
    @State private var path : [ReminderDestination] = []

    var body: some View {
        NavigationStack(path: $path){
            List {
                Section{
                    TitleItemView(text: $viewModel.titleText,placeholder: "Title")
                    TitleItemView(text: $viewModel.notesText,placeholder: "Notes")
                }
                Section{
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.date){
                        DatePicker(
                            "Date",
                            selection: $viewModel.date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.time){
                        DatePicker(
                            "Time",
                            selection: $viewModel.date,
                            displayedComponents: [.hourAndMinute]
                        )
                        .datePickerStyle(.wheel)
                    }
                }
                Section {
                    MenuItemView(
                        menu: reminders,
                        item: ReminderSectionConstant.EarlyReminder,
                        selected: $viewModel.titleText
                    )
                    NavigationLinkItemView(
                        item: ReminderSectionConstant.repeat,
                        value: ReminderDestination.repeat,
                        selected: "Never"
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
}

#Preview {
    ReminderView(viewModel: ReminderViewModel())
}
