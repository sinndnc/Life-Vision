//
//  ReminderAddView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.06.2024.
//

import SwiftUI

struct ReminderAddView: View {
    
    @State var reminder : Reminder = Reminder()
    @StateObject var viewModel : ReminderViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            ReminderView(reminder: $reminder){
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }trailing: {
                Button("Add") {
                    presentationMode.wrappedValue.dismiss()
                    viewModel.add(reminder)
                }
                .disabled(reminder.title.isEmpty)
            }
        }
    }
}


#Preview {
    ReminderAddView(viewModel: ReminderViewModel())
}
