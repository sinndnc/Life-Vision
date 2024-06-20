//
//  ReminderViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class ReminderViewModel : ObservableObject{
    
    @Service private var reminderRepository : ReminderRepositoryProtocol
    @Service private var notificationService : NotificationServiceProtocol

    let repeats = Repeat.list
    let earlyReminders = EarlyReminder.list
    
    @Published var reminder : Reminder
    @Published var isPresented : Bool = false
    @Published var tagTextfield : String = ""
    
    init(reminder : Reminder){
        self.reminder = reminder
    }
    
    func update(){
        
    }
    
    
    func add(){
        reminderRepository.add(reminder) { result in
            switch result {
            case .success(let documentID):
                self.onSuccess()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    private func onSuccess(){
        let timeInterval = self.reminder.start_date.timeIntervalSinceNow
        let notification = TimeIntervalNotificaton(
            title: reminder.title,
            content: reminder.notes,
            categoryIdentifier: "test",
            timeInterval: timeInterval
        )
        self.scheduleTimeIntervalNotification(notification)
    }
    
    func scheduleTimeIntervalNotification(_ notification : TimeIntervalNotificaton){
        notificationService.scheduleTimeIntervalNotification(notification)
    }
    
    
    
}
