//
//  ReminderViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class ReminderViewModel : ObservableObject{
    
    @Inject private var reminderRepository : ReminderRepositoryProtocol
    @Inject private var notificationService : NotificationServiceProtocol
    
    @Published var isPresented : Bool = false
    @Published var reminder : Reminder = Reminder()

    func add(_ reminder : Reminder){
        reminderRepository.add(reminder) { result in
            switch result {
            case .success(let documentID):
                self.onSuccess(reminder: reminder)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    private func onSuccess(reminder : Reminder){
        let timeInterval = reminder.start_date.timeIntervalSinceNow
        let notification = TimeIntervalNotificaton(
            title: reminder.title,
            content: reminder.notes,
            timeInterval: timeInterval, 
            categoryIdentifier: Notification.MESSAGES
        )
        self.scheduleTimeIntervalNotification(notification)
    }
    
    func scheduleTimeIntervalNotification(_ notification : TimeIntervalNotificaton){
        notificationService.scheduleTimeIntervalNotification(notification)
    }
    
    
    
}
