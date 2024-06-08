//
//  RepeatView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct RepeatView: View {
    
    @Binding var path : [ReminderDestination]
    @StateObject var viewModel : ReminderViewModel
    
    
    var body: some View {
        List{
            Section{
                ForEach(viewModel.repeats,id:\.self){ item in
                    HStack{
                        Button {
                            viewModel.reminder.repeat = item
                            path.removeAll()
                        } label: {
                            HStack{
                                Text(item)
                                Spacer()
                                viewModel.reminder.repeat == item ? Image(systemName: "checkmark") : nil
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    RepeatView(path: .constant([]), viewModel: ReminderViewModel())
}
