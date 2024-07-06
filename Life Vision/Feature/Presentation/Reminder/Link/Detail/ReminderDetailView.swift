//
//  ReminderDetailView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 20.06.2024.
//

import SwiftUI

struct ReminderDetailView: View {
    
    var geo : GeometryProxy
    @Binding var reminder : Reminder
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading,spacing:15){
                    Text(reminder.title)
                        .font(.title2)
                        .fontWeight(.medium)
                    HStack{
                        Text("Status")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .frame(width: geo.size.width * 0.2,alignment: .leading)
                        Text("On Progress")
                            .font(.footnote)
                    }
                    HStack{
                        Text("Due Date")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .frame(width: geo.size.width * 0.2,alignment: .leading)
                        Text(reminder.finish_date,style: .date)
                            .font(.footnote)
                    }
                    HStack{
                        Text("Assignee")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .frame(width: geo.size.width * 0.2,alignment: .leading)
                        Image("DefaultImage")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 25,height: 25)
                    }
                    HStack{
                        Text("Tags")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .frame(width: geo.size.width * 0.2,alignment: .leading)
                        HStack{
                            ForEach(reminder.tags,id:\.self){tag in
                                Text(tag)
                                    .padding(2)
                                    .font(.footnote)
                                    .background(.yellow.opacity(0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                            }
                        }
                    }
                    VStack(alignment:.leading){
                        HStack{
                            Text("Notes")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        Text(reminder.notes)
                            .padding(7)
                            .font(.footnote)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray.opacity(0.5), lineWidth: 1))
                    }
                    .padding(1)
                }
            }
        }
        .padding()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        ReminderDetailView(geo: geometry,reminder: .constant(Reminder(
        title: "KPI and Employee Statistics Page",
        notes: "This page aims to provide real-time insights into emploe performance metrics and key business indicators.",
        tags: ["Dental","Tennis","Software"]
        
        )))
    })
    
}
