//
//  HomeViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Foundation

final class HomeViewModel : ObservableObject{
    
    @Inject var calendarService : CalendarServiceProtocol
    @Inject var reminderRepository : ReminderRepositoryProtocol

    //Countdown
    @Published var upcoming : Reminder? = nil
    @Published var countDown : Countdown? = nil

    //Reminders
    @Published var reminders : [Int :[Reminder]] = [:]
    //WorkSpace
    @Published var selectedCategory : ReminderCategory = .today
    
    init(){
        fetchReminders()
    }
    
   private func fetchReminders(){
        reminderRepository.fetch { result in
            switch result {
            case .success(let reminders):
                self.reminders = reminders
                let filtered = reminders.flatMap{ $0.value }.filter { $0.start_date > .now }
                self.upcoming = filtered.sorted { $0.start_date < $1.start_date }.first
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func filterReminders(reminders: [Int: [Reminder]], by status: ReminderCategory) -> [Reminder] {
        
        let flattedReminders = reminders.flatMap { $0.value }.sorted{ $0.start_date < $1.start_date }
        
        return flattedReminders.filter { reminder in
            switch status {
            case .inProgress:
                return inProgress(reminder.start_date,reminder.finish_date)
            case .today:
                return reminder.start_date.isToday
            case .tomorrow:
                return  reminder.start_date.isTomorrow
            case .inWeek:
                return reminder.start_date.isInWeek
            case .scheduled:
                return reminder.start_date > .now
            case .completed:
                return reminder.finish_date < .now
            }
        }
    }
    
    private func inProgress(_ start_date: Date,_ finish_date : Date) -> Bool {
        return start_date < .now  && .now < finish_date
    }
    
    
}
