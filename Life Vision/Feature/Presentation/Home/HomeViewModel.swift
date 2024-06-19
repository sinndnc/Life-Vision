//
//  HomeViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Foundation

final class HomeViewModel : ObservableObject{
    
    @Service var calendarService : CalendarServiceProtocol
    @Service var reminderRepository : ReminderRepositoryProtocol
    
    //CountDown
    @Published var countdown : Countdown = Countdown()
    @Published var upComingReminder : Reminder = Reminder()
    //Reminders
    @Published var classifiedReminders : [Int :[Reminder]] = [:]
    //WorkSpace
    @Published var filteredTasksByCategory : [Reminder] = []
    @Published var workSpaceCategorySelected : ReminderCategory = .today
    @Published var workSpaceCategories : [ReminderCategory] = [.completed,.inProgress,.today,.tomorrow,.inWeek,.scheduled]
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let classfiedReminders):
                self.classifiedReminders = classfiedReminders
                let currentDay = self.calendarService.getCurentDay.number
                let filteredclassfiedReminders = classfiedReminders[currentDay]?.filter { $0.start_date > Date() } ?? []
                self.upComingReminder = filteredclassfiedReminders.sorted { $0.start_date < $1.start_date }.first ?? Reminder()
                self.countdown = self.upComingReminder.start_date.timeIntervalSinceNow.formatTimeInterval()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func filterReminders(reminders: [Int: [Reminder]], by status: ReminderCategory) -> [Reminder] {
        
        let flattedReminders = reminders.flatMap { $0.value }
        
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
