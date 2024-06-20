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
        
    @Published var selectedHeaderDay : Int = 0
    
    @Published var viewUIState : UIState = .initial
    @Published var headerViewUIState : UIState = .initial
    @Published var graphicViewUIState : UIState = .initial

    @Published var classifiedReminders : [Int :[Reminder]] = [:]

    
    init(){
        selectedHeaderDay = calenderService.getCurentDay.number
    }
    
    
    func update(_ reminder : Reminder){
        reminderRepository.update(reminder) { result in
            switch result {
            case .success(let documentID):
                print(documentID)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let classifiedReminders):
                self.classifiedReminders = classifiedReminders
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
