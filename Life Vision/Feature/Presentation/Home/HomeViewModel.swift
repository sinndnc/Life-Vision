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
    @Published var workSpaceCategorySelected : WorkSpaceCategory = .today
    @Published var workSpaceCategories : [WorkSpaceCategory] = [.completed,.inProgress,.today,.tomorrow,.inWeek,.inMonth,.scheduled]
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let classfiedReminders):
                self.classifiedReminders = classfiedReminders
                let currentDay = self.calendarService.getCurentDay.number
                self.upComingReminder = classfiedReminders[currentDay]?.sorted(by: { $0.start_date > $1.start_date }).first ?? Reminder()
                self.countdown = self.upComingReminder.start_date.timeIntervalSinceNow.formatTimeInterval()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
