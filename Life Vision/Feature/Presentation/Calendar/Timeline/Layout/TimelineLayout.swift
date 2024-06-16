//
//  TimelineLayout.swift
//  Life Vision
//
//  Created by Sinan Dinç on 30.05.2024.
//

import SwiftUI


struct TimelineLayout: Layout {
    
    var reminders : [Reminder]
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        
        let hour = subviews[0].sizeThatFits(.unspecified)
        let divider = subviews[1].sizeThatFits(.unspecified)
        
        return CGSize(width: hour.width + divider.width, height: hour.height / 24 * 23 )

    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        
        let hour = subviews[0]
        let divider = subviews[1]
        let nowDivider = subviews[2]
        let reminder = subviews[3]

        let hourSize = hour.sizeThatFits(.unspecified)
        let reminderSize = reminder.sizeThatFits(.unspecified)
        
        hour.place(at: CGPoint(x: 0, y: Int(bounds.minY)), proposal: .unspecified)
        divider.place(at: CGPoint(x: Int(hourSize.width), y: Int(bounds.minY)), proposal: .unspecified)
        
        let nowDividerHeight = (hourSize.height / 25) * Date().toHour().toTimePercentage() + bounds.minY
        nowDivider.place(at: CGPoint(x: 0, y: nowDividerHeight), proposal: .unspecified)
        
        
        for (index , subview) in subviews.enumerated(){
            let firstIndex = 3
            
            if index > 2 {
                
                var height = bounds.minY
            
                let reminder = reminders[index - firstIndex].start_date.toHour().toTimePercentage()
                let taskHeight = (hourSize.height / 25) * reminder
                height += taskHeight

            
                
                
                subview.place(
                    at: CGPoint(x: Int(hourSize.width), y: Int(height)),
                    proposal: .unspecified
                )
                
                height = bounds.minY

            }
        }
    }
}

#Preview {
    GeometryReader{ geo in
        let reminders : [Reminder] = [
            Reminder(title: "test", start_date: .now, finish_date: .now),
            Reminder(title: "test 1 ", start_date: Calendar.current.date(byAdding: .hour, value: -2, to: .now)!, finish_date: .now),
            Reminder(title: "test   1", start_date: Calendar.current.date(byAdding: .hour, value: -4, to: .now)!, finish_date: .now)

        ]
    
        ScrollView {
            
            ZStack{}
            .frame(width: 300,height: 100)
            TimelineLayout(reminders: reminders) {
                TimelineHourView(geo: geo)
                TimelineDividerView(geo: geo)
                TimelineNowView(geo: geo)
                ForEach(reminders,id: \.self){ reminder in
                    TimelineTaskView(geo: geo,reminder: reminder)
                }
            }
        }
    }
   
}
