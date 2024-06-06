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

        let hourSize = hour.sizeThatFits(.unspecified)
       
        hour.place(at: CGPoint(x: 0, y: Int(bounds.minY)), proposal: .unspecified)
        divider.place(at: CGPoint(x: Int(hourSize.width), y: Int(bounds.minY)), proposal: .unspecified)
        
        
        for (index , subview) in subviews.enumerated(){
            
            if index > 1 {
                
                var width = bounds.minX
                var height = bounds.minY
                
                reminders.forEach { reminder in
                    let taskHeight = (hourSize.height / 25) * reminder.start_date.toHour()
                    height = taskHeight
                }

                let nowDividerHeight = (hourSize.height / 25) * Date().toHour().toTimePercentage()
                
                width = index == subviews.endIndex - 1 ? 0 : hourSize.width
                height = index == subviews.endIndex - 1 ? nowDividerHeight : height

                
                subview.place(
                    at: CGPoint(x: Int(width), y: Int(height)),
                    proposal: .unspecified
                )
                 
                width = bounds.minX
                height = bounds.minY
                
            }
        }
    }
}

#Preview {
    GeometryReader{ geo in
        let reminders : [Reminder] = [Reminder(title: "", start_date: .now, finish_date: .now),]
    
        ScrollView {
            ZStack{}
            .frame(width: 300,height: 100)
            TimelineLayout(reminders: reminders) {
                TimelineHourView(geo: geo)
                TimelineDividerView(geo: geo)
                ForEach(reminders,id: \.self){ reminder in
                    TimelineTaskView(geo: geo,reminder: reminder)
                }
                TimelineNowView(geo: geo)
            }
        }
    }
   
}
