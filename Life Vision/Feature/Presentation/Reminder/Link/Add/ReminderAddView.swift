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
            ReminderView(reminder: $reminder){
                Button("Cancel") {
                    viewModel.isPresented.toggle()
                }
            }trailing: {
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
