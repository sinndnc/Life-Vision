//
//  TimelineView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 30.05.2024.
//

import SwiftUI

struct TimelineGraphicView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : CalendarViewModel

    @State var hasIntersectWithAfter : Bool = false
    @State var hasIntersectWithBefore: Bool = false

    var body: some View {
        
        let mergedReminders = mergeOverlappingReminders(viewModel.reminders)

        TimelineLayout(reminders: viewModel.reminders) {
            TimelineHourView(geo: geo)
            TimelineDividerView(geo: geo)
            TimelineNowDividerView(geo: geo)
            ForEach(mergedReminders,id: \.self) { reminder in
               
                TimelineTaskView(geo: geo, reminder: reminder)
                
            }
        }
    }
}


func mergeOverlappingReminders(_ reminders: [Reminder]) -> [Reminder] {
    if reminders.isEmpty { return [] }
    
    let sortedReminders = reminders.sorted { $0.start_date < $1.start_date }
    var mergedReminders: [Reminder] = []
    var currentReminder = sortedReminders[0]
    //var groupdedMergedReminders : [Reminder : [Reminder]] = [:]
    
    for reminder in sortedReminders.dropFirst() {
        
        let reminderRange = reminder.start_date...reminder.finish_date
        let currentRange = currentReminder.start_date...currentReminder.finish_date
        
        if reminderRange.overlaps(currentRange) {
            
            currentReminder.finish_date = max(currentReminder.finish_date, reminder.finish_date)
        } else {
            mergedReminders.append(currentReminder)
            currentReminder = reminder
        }
    }
    
    mergedReminders.append(currentReminder)
    
    return mergedReminders
}

//
//let before = index > 0 ? viewModel.reminders[index - 1] : nil
//let after = index < viewModel.reminders.count - 1 ? viewModel.reminders[index + 1] : nil
//
//if let afterElement = after{
//    
//    let dateRange = currentElement.start_date...currentElement.finish_date
//    let hasIntersect = dateRange.contains(afterElement.start_date)
//
//    if hasIntersect{
//        TimelineGroupTaskView(geo: geo,reminders: [currentElement,afterElement])
//            .onAppear{
//                hasIntersectWithAfter = true
//            }
//    }else{
//        TimelineTaskView(geo: geo,reminder: currentElement)
//            .onAppear{
//                hasIntersectWithAfter = false
//            }
//    }
//    
//    if let beforeElement = before{
//        
//    }
//}else{
//    if let beforeElement = before{
//        let dateRange = beforeElement.start_date...beforeElement.finish_date
//        let hasIntersect = dateRange.contains(currentElement.start_date)
//        
//        if hasIntersect{
//            TimelineGroupTaskView(geo: geo,reminders: [beforeElement,currentElement])
//                .onAppear{
//                    hasIntersectWithAfter = true
//                }
//        }else{
//            TimelineTaskView(geo: geo,reminder: currentElement)
//                .onAppear{
//                    hasIntersectWithAfter = false
//                }
//        }
//    }
//}

#Preview {
    GeometryReader(content: { geometry in
        TimelineGraphicView(geo: geometry,viewModel: CalendarViewModel())
    })
}

