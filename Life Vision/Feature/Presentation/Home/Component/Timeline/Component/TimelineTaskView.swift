//
//  TimelineTaskView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import SwiftUI

struct TimelineTaskView: View {
    
    var geo : GeometryProxy
    var reminder : Reminder

    var body: some View {
        let width = geo.size.width * 0.8
        let height = geo.size.height * 0.1
        
        let start_date = String(format: "%.2f", reminder.start_date.toHour())
        let finish_date = String(format: "%.2f", reminder.finish_date.toHour())
        
        HStack(alignment: .center){
            VStack(alignment: .leading,spacing: 0) {
                Text(reminder.title)
                    .font(.headline)
                Text("\(start_date) - \(finish_date)")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            Spacer()
            Image(systemName:"circle")
        }
        .padding(8)
        .background(.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(5)
        .frame(width: width,height: height)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineTaskView(geo: geometry,reminder: Reminder(title: "test title", start_date: .now, finish_date: .now))
    })
}
