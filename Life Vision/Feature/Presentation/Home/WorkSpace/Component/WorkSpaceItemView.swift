//
//  WorkSpaceItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceItemView: View {
    
    var reminder : Reminder
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10, content: {
            Text(reminder.title)
                .font(.subheadline)
                .fontWeight(.medium)
            HStack(content: {
                Text(reminder.notes)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Spacer()
                Text("\(reminder.start_date)")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Image(systemName: "person")
            })
        })
        .padding()
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
}

#Preview {
    WorkSpaceItemView(reminder: Reminder())
}
