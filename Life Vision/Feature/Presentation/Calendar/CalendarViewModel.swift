//
//  CalendarViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation


final class CalendarViewModel : ObservableObject {
    
    @Service var calenderService : CalendarServiceProtocol
    @Service var reminderRepository : ReminderRepositoryProtocol
    
    @Published var reminders : [Reminder] = []
    
    @Published var viewUIState : UIState = .initial
    @Published var headerViewUIState : UIState = .initial
    @Published var graphicViewUIState : UIState = .initial
    
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(var reminders):
                let sortedReminders = reminders.sorted(by: { $0.start_date < $1.start_date })
                self.reminders = sortedReminders
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
