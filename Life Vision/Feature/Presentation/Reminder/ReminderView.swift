//
//  ReminderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ReminderView: View {
    
    @StateObject var viewModel : ReminderViewModel

    var body: some View {
        NavigationStack(){
            ReminderDetailView(viewModel: viewModel)
                .toolbar(viewModel: viewModel)
        }
    }
    
}

fileprivate extension View{
   
    func toolbar(viewModel: ReminderViewModel) -> some View {
        return toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    viewModel.isPresented.toggle()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add") {
                    viewModel.isPresented.toggle()
                    viewModel.add()
                }
                .disabled(viewModel.reminder.title.isEmpty)
            }
        }
    }
    
}

#Preview {
    ReminderView(viewModel: ReminderViewModel(reminder: Reminder()))
}
