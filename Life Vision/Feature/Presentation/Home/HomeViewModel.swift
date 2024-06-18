//
//  HomeViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Foundation

final class HomeViewModel : ObservableObject{
    
    @Service var reminderRepository : ReminderRepositoryProtocol
    
    @Published var reminders : [Reminder] = []
    @Published var countdown : Countdown = Countdown(day: 1, hour: 13, minute: 34, seconds: 12)
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(var classfiedReminders):
                let sortedReminders = classfiedReminders[17]?.sorted(by: { $0.start_date < $1.start_date })
                self.reminders = sortedReminders ?? []
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
