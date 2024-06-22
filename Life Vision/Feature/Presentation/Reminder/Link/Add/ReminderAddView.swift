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
    
    var body: some View {
        NavigationStack{
            ReminderView(reminder: $reminder)
                .toolbar(viewModel: viewModel,reminder: reminder)
        }
    }
}

fileprivate extension View{
   
    func toolbar(viewModel: ReminderViewModel,reminder: Reminder) -> some View {
        return toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    viewModel.isPresented.toggle()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add") {
                    viewModel.isPresented.toggle()
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
