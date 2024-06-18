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
    
    var body: some View {
        let width = geo.size.width * 0.8
        let height = geo.size.height * 0.1
        
        let firstElementHeight = reminders[0].start_date.convertHourPercentage
        let secondElementHeight = reminders[1].start_date.convertHourPercentage

        HStack(alignment: .center){
            VStack(alignment: .leading) {
                Text("2 Group tasks")
                    .font(.headline)
                Text("hold press to see all tasks")
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
            Button("show all tasks") {
                
            }
        }preview: {
            VStack {
                ForEach(reminders,id:\.self){ reminder in
                    TimelineTaskView(geo: geo, reminder: reminder)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GeometryReader { geometry in
        let reminders = [Reminder(),Reminder()]
        TimelineGroupTaskView(geo:geometry,reminders: reminders)
    }
}

