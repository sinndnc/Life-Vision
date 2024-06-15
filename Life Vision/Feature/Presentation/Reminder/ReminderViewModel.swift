//
//  ReminderViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class ReminderViewModel : ObservableObject{
    
    let repeats = Repeat.list
    let earlyReminders = EarlyReminder.list
    
    @Service private var reminderRepository : ReminderRepositoryProtocol
    @Service private var notificationService : NotificationServiceProtocol

    @Published var isPresented : Bool = false
    @Published var reminder : Reminder = Reminder()

    func add(_ reminder : Reminder){
        reminderRepository.add(reminder) { result in
            switch result {
            case .success(let documentID):
                let timeInterval = reminder.start_date.timeIntervalSinceNow
                let notification = TimeIntervalNotificaton(
                    title: reminder.title,
                    content: reminder.notes,
                    categoryIdentifier: "test",
                    timeInterval: timeInterval
                )
                self.scheduleTimeIntervalNotification(notification)
                print(timeInterval)
                print(documentID)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    func scheduleTimeIntervalNotification(_ notification : TimeIntervalNotificaton){
        notificationService.scheduleTimeIntervalNotification(notification)
    }
    
    
    
}
