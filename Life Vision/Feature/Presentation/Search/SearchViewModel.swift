//
//  SearchViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class SearchViewModel : ObservableObject {
    
    @Inject var reminderRepository : ReminderRepositoryProtocol
    
    @Published var reminders : [ReminderCategory : [Reminder]] = [:]
   
    init(){ 
        fetchReminders()
    }
    
    func fetchReminders()  {
        reminderRepository.fetch { result in
            switch result {
            case .success(let classfiedReminders):
                self.reminders = self.categoryFilter(reminders: classfiedReminders)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func searchFilter(_ query : String ,_ reminders : [ReminderCategory : [Reminder]]) -> [ReminderCategory: [Reminder]]  {
        guard !query.isEmpty else { return reminders }

        var filteredReminders: [ReminderCategory: [Reminder]] = [:]

        for (category, reminderList) in reminders {
                let matchingReminders = reminderList.filter { reminder in
                    reminder.title.lowercased().contains(query.lowercased()) ||
                    reminder.notes.lowercased().contains(query.lowercased())
                }
                if !matchingReminders.isEmpty {
                    filteredReminders[category] = matchingReminders
                }
            }
        
        return filteredReminders
    }
    
    private func categoryFilter(reminders: [Int: [Reminder]]) -> [ReminderCategory: [Reminder]] {
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
