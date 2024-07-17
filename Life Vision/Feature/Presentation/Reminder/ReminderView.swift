//
//  ReminderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ReminderView<Leading:View,Trailing:View> : View {
    
    @Binding var reminder : Reminder
    @ViewBuilder let leading : Leading
    @ViewBuilder let trailing : Trailing
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            List {
                Section{
                    TitleItemView(text: $reminder.title, placeholder: "Title")
                    TitleItemView(text: $reminder.notes, placeholder: "Notes")
                }
                Section{
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.date){
                        DatePicker(
                            "Start date:",
                            selection: $reminder.start_date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact)
                        DatePicker(
                            "Finish date:",
                            selection: $reminder.finish_date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.compact)
                    }
                    ToggleDisclosureGroupView(item: ReminderSectionConstant.time){
                        VStack{
                            DatePicker(
                                "Start time:",
                                selection: $reminder.start_date,
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            DatePicker(
                                "Finish time:",
                                selection: $reminder.finish_date,
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                        }
                    }
                }
                Section {
                    MenuItemView(
                        menu: EarlyReminder.list,
                        item: ReminderSectionConstant.EarlyReminder,
                        selected: $reminder.early_reminder
                    )
                    NavigationLinkDestinationView(
                        item: ReminderSectionConstant.repeat,
                        selected: reminder.repeat,
                        content: {
                            RepeatView(reminder: $reminder)
                        }
                    )
                }
                Section{
                    NavigationLinkDestinationView(
                        item: ReminderSectionConstant.tag,
                        selected: "0 selected",
                        content: {
                            TagsView(reminder: $reminder)
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
            .toolbar{
                if (presentationMode.wrappedValue.isPresented) {
                    ToolbarItem(placement: .topBarLeading, content: { leading })
                }
                ToolbarItem(placement: .topBarTrailing, content: { trailing
                })
            }
        }
    }
}



#Preview {
    ReminderView(reminder: .constant(Reminder()))  {
        Button(action: {}, label: {
            Text("Cancel")
        })
    } trailing: {
        Button(action: {}, label: {
            Text("Done")
        })
    }
}
