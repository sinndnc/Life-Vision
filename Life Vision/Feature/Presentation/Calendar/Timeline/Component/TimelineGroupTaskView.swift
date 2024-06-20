//
//  TimelineGroupTaskView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 17.06.2024.
//

import SwiftUI

struct TimelineGroupTaskView: View {
    
    var geo : GeometryProxy
    var reminders : [Reminder]
    
    @State var isPresented : Bool = false

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
                List(reminders,id: \.self) { reminder in
                    let viewModel = ReminderViewModel(reminder: reminder)
                    NavigationLink(
                        destination:{
                            ReminderDetailView(viewModel: viewModel)
                                .toolbar(viewModel: viewModel)
                        }
                    ){
                        SearchTaskItemView(geo: geo, reminder: reminder)
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .localizedNavigationTitle(title: "Reminders")
            }
        })
    }
}

fileprivate extension View{
   
    func toolbar(viewModel: ReminderViewModel) -> some View {
        return toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Update") {
                    viewModel.update()
                }
                .disabled(viewModel.reminder.title.isEmpty)
            }
        }
    }
    
}


#Preview {
    GeometryReader { geometry in
        let reminders = [Reminder(),Reminder()]
        TimelineGroupTaskView(geo:geometry,reminders: reminders)
    }
}

