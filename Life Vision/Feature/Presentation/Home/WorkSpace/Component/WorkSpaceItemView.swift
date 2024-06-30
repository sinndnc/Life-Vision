//
//  WorkSpaceItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceItemView: View {
    
    var geo : GeometryProxy
    var reminder : Reminder
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack{
                Circle()
                    .frame(width: 5,height: 5)
                    .foregroundStyle(.yellow)
                Text("Medium")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                Spacer()
                Text("#Dental")
                    .padding(5)
                    .font(.caption)
                    .background(.blue)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack(alignment: .leading){
                Text(reminder.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(reminder.notes)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
            }
            HStack{
                Text(reminder.start_date,style: .time)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Text("-")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Text(reminder.finish_date,style: .time)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Spacer()
                HStack(spacing: -10){
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 1))

                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 1))
                    
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 1))
                }
            }
        })
        .padding(10)
        .background(.black.opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(height: geo.size.height * 0.2)
    }
    
}

#Preview {
    GeometryReader(content: { geometry in
        WorkSpaceItemView(geo: geometry,reminder: Reminder(title: "Color palette selection",notes: "Create a hormonuious color scheme"))
    })
}
