//
//  ReminderGroups.swift
//  Life Vision
//
//  Created by Sinan Dinç on 13.06.2024.
//

import Foundation

enum ReminderCategory : String , Hashable , CaseIterable{
    case completed
    case inProgress
    case today
    case tomorrow
    case inWeek
    case scheduled
    
    
    static func category(for reminder: Reminder) -> ReminderCategory {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let reminderDate = calendar.startOfDay(for: reminder.start_date)
        
        if reminderDate < today {
            return .completed
        } else if reminderDate == today {
            return .today
        } else if let tomorrow = calendar.date(byAdding: .day, value: 1, to: today), reminderDate == tomorrow {
            return .tomorrow
        } else if let nextWeek = calendar.date(byAdding: .day, value: 7, to: today), reminderDate <= nextWeek {
            return .inWeek
        } else {
            return .scheduled
        }
    }
}
