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
    
    @Published var isPresented : Bool = false
    @Published var reminder : Reminder = Reminder()

    func add(_ reminder : Reminder){
        reminderRepository.add(reminder) { result in
            switch result {
            case .success(let documentID):
                print(documentID)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
