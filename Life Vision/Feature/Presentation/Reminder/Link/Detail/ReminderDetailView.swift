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
    @State var selected : ReminderDetailEnum = .comments
    @State var menu : [String] = ["Comments", "OnBoard","Locations"]

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text(reminder.title)
                        .font(.title2)
                        .fontWeight(.medium)
                    HStack{
                        Text("Status")
                            .font(.footnote)
                            .foregroundStyle(.gray)
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
                                    .padding(.horizontal,5)
                                    .padding(.vertical,3)
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .background(.yellow.opacity(0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                   
                }
                .frame(
                    width: geo.size.width,
                    height: geo.size.height * 0.25
                )
            }
        }
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
