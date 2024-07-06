//
//  TimelineTaskView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import SwiftUI

struct TimelineTaskView: View {
    
    var geo : GeometryProxy
    @State var reminder : Reminder
    @State var isPresented : Bool = false
    
    var body: some View {
        
        let taskHourInterval = reminder.finish_date.toHour() - reminder.start_date.toHour()
        
        let start_date = String(format: "%.2f", reminder.start_date.toHour())
        let finish_date = String(format: "%.2f", reminder.finish_date.toHour())
        
        let width = geo.size.width * 0.8
        let height = geo.size.height * 0.1 * taskHourInterval
        
        HStack(alignment: .center){
            Rectangle()
                .frame(width: 2)
                .foregroundStyle(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(reminder.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Spacer()
                Text("\(start_date)-\(finish_date)")
                    .font(.caption2)
                    .foregroundStyle(.white)
            }
            Spacer()
            Image(systemName: "info.circle")
                .foregroundStyle(.white)
        }
        .zIndex(1)
        .padding(.vertical,5)
        .padding(.horizontal,10)
        .frame(width: width,height: height)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .sheet(isPresented: $isPresented, content: {
            NavigationStack {
                ReminderDetailView(geo:geo,reminder: $reminder)
                    
            }
        })
        .onTapGesture { isPresented.toggle() }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineTaskView(geo: geometry,reminder: Reminder(title: "Practice with neptün",notes: "don't forget to get the balss",tags: ["Dental","Tennis"]))
    })
}
