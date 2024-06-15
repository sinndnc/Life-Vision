//
//  HomeViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Foundation

final class HomeViewModel : ObservableObject{
    
    @Service var calenderService : CalendarServiceProtocol
    @Service var reminderRepository : ReminderRepositoryProtocol
    @Service var notificationService : NotificationServiceProtocol
    
    @Published var reminders : [Reminder] = []
    
    @Published var viewUIState : UIState = .initial
    @Published var headerViewUIState : UIState = .initial
    @Published var graphicViewUIState : UIState = .initial
    
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let reminders):
                self.reminders = reminders
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
