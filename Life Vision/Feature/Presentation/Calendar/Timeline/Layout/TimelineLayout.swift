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

        let hourSize = hour.sizeThatFits(.unspecified)

        hour.place(at: CGPoint(x: 0, y: Int(bounds.minY)), proposal: .unspecified)
        divider.place(at: CGPoint(x: Int(hourSize.width), y: Int(bounds.minY)), proposal: .unspecified)
        
        let nowDividerHeight = (hourSize.height / 25) * Date().toHour().toTimePercentage() + bounds.minY
        nowDivider.place(at: CGPoint(x: 0, y: nowDividerHeight), proposal: .unspecified)
        
        let remainingSubviews = subviews.dropFirst(3)

        for (index , subview) in remainingSubviews.enumerated(){
        
            let elementHeight = bounds.minY
            let hourHeight = (hourSize.height / 25)

            let currentElement = reminders[index]
            let currentElementHeight = hourHeight * currentElement.start_date.convertHourPercentage

            subview.place(
                at: CGPoint(x: Int(hourSize.width), y: Int(elementHeight + currentElementHeight)),
                proposal: .unspecified
            )
        }
    }
}


#Preview {
    GeometryReader{ geo in
        let reminders : [Reminder] = [
            Reminder(title: "test", start_date: .now, finish_date: .now),
            Reminder(title: "test 1 ", start_date: Calendar.current.date(byAdding: .hour, value: -2, to: .now)!, finish_date: .now),
            Reminder(title: "test   1", start_date: Calendar.current.date(byAdding: .hour, value: -1, to: .now)!, finish_date: .now),
            Reminder(title: "test   1", start_date: Calendar.current.date(byAdding: .minute, value: -30, to: .now)!, finish_date: .now)

        ]
        let mergedReminders = mergeOverlappingReminders(reminders)
    
        ScrollView {
            
            ZStack{}
            .frame(width: 300,height: 100)
            TimelineLayout(reminders: reminders) {
                TimelineHourView(geo: geo)
                TimelineDividerView(geo: geo)
                TimelineNowDividerView(geo: geo)
                ForEach(mergedReminders,id: \.self){ reminder in
                    TimelineTaskView(geo: geo,reminder: reminder)
                }
            }
        }
    }
   
}
