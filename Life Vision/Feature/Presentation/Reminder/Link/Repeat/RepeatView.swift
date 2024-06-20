//
//  RepeatView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct RepeatView: View {
    
    @Binding var reminder : Reminder

    var body: some View {
        List{
            Section{
                ForEach(Repeat.list,id:\.self){ item in
                    HStack{
                        Button {
                            reminder.repeat = item
                        } label: {
                            HStack{
                                Text(item)
                                Spacer()
                                reminder.repeat == item ? Image(systemName: "checkmark") : nil
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
    RepeatView(reminder: .constant(Reminder()))
}
