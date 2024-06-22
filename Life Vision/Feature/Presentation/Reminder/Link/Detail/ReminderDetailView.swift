//
//  ReminderDetailView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 20.06.2024.
//

import SwiftUI

struct ReminderDetailView: View {
    
    @Binding var reminder : Reminder
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ReminderView(reminder: $reminder)
            .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Update") {
                    //viewModel.update(reminder.wrappedValue)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    ReminderDetailView(reminder: .constant(Reminder()))
}
