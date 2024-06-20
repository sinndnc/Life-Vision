//
//  TimelineGroupTaskView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 17.06.2024.
//

import SwiftUI

struct TimelineGroupTaskView: View {
    
    var geo : GeometryProxy
    @State var reminders : [Reminder]
    @State var isPresented : Bool = false
    @StateObject var viewModel : CalendarViewModel
    

    var body: some View {
        
        let startHour = reminders.first!.start_date.toHour()
        let finishHour = reminders.last!.finish_date.toHour()
        let taskHourInterval = finishHour - startHour
        
        let width = geo.size.width * 0.8
        let height = geo.size.height * 0.1 * taskHourInterval
        
        
        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text("You have \(reminders.count) task here")
                    .font(.headline)
                Text("Long press to see all details")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            Spacer()
            Image(systemName:"info.circle")
        }
        .padding()
        .frame(width: width,height: height)
        .background(.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .contextMenu {
            Button("Show details") {
                isPresented.toggle()
            }
        }preview: {
            ScrollView{
                VStack{
                    ForEach(reminders,id:\.self){ reminder in
                        TimelineTaskView(geo: geo, reminder: reminder)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isPresented, content: {
            NavigationStack{
                List($reminders,id: \.self) { reminder in
                    NavigationLink(
                        destination:{
                            ReminderDetailView(reminder: reminder)
                                .toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button("Update") {
                                            viewModel.update(reminder.wrappedValue)
                                        }
                                    }
                                }
                        }
                    ){
                        SearchTaskItemView(geo: geo, reminder: reminder.wrappedValue)
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .localizedNavigationTitle(title: "Reminders")
            }
        })
    }
}




#Preview {
    GeometryReader { geometry in
        let reminders = [Reminder(),Reminder()]
        TimelineGroupTaskView(geo:geometry,reminders: reminders, viewModel: CalendarViewModel())
    }
}

