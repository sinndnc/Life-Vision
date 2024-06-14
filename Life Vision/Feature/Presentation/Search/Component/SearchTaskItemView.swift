//
//  SearchTaskItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 14.06.2024.
//

import SwiftUI

struct SearchTaskItemView: View {
    
    var geo : GeometryProxy
    var reminder : Reminder
    
    var body: some View {
        HStack(alignment: .bottom){
            VStack(alignment: .leading){
                Text("Plant the tree")
                    .fontWeight(.semibold)
                Text("don't forget plase so important for me")
                    .lineLimit(1)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .truncationMode(.tail)
            }
            Spacer()
            HStack(spacing:5){
                Text(reminder.start_date,style: .time)
                    .font(.caption)
            }
        }
        .frame(height: geo.size.height * 0.075 )
    }
}

#Preview {
    GeometryReader(content: { geometry in
        SearchTaskItemView(
            geo:geometry,
            reminder: Reminder(
                title: "Plant the tree",
                notes: "don't forget plase so important for me"
            )
        )
    })
}
