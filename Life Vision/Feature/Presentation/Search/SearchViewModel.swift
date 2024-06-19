//
//  SearchViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class SearchViewModel : ObservableObject {
    
    @Service var reminderRepository : ReminderRepositoryProtocol
    
    @Published var searchable : String = ""
    @Published var filteredTasksByCategories : [ReminderCategory : [Reminder]] = [:]
   
    init(){ fetchReminders() }
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let classfiedReminders):
                self.filteredTasksByCategories = self.filteredRemindersByCategories(reminders: classfiedReminders)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func filteredRemindersByCategories(reminders: [Int: [Reminder]]) -> [ReminderCategory: [Reminder]] {
        var categorizedReminders: [ReminderCategory: [Reminder]] = [:]
        
        for (_, remindersArray) in reminders {
            for reminder in remindersArray {
                let category = ReminderCategory.category(for: reminder)
                if categorizedReminders[category] != nil {
                    categorizedReminders[category]?.append(reminder)
                } else {
                    categorizedReminders[category] = [reminder]
                }
            }
        }
        return categorizedReminders
    }
    
    
}
