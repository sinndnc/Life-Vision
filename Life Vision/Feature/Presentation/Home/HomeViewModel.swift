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

    @Published var headerViewUIState : UIState = .initial
    @Published var graphicViewUIState : UIState = .initial
    @Published private (set) var reminders : [Reminder] = []

    var currentDay : Day { calenderService.getCurentDay }

    init() {
        fetchReminders()
    }
    
    func fetchReminders() {
        reminderRepository.fetch{ result in
            switch result {
            case .success(let reminders):
                print(reminders)
                self.reminders.append(contentsOf: reminders)
            case .failure(let failure):
                print(failure)
            }
        }
    }

}
