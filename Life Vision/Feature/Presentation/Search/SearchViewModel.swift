//
//  SearchViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class SearchViewModel : ObservableObject {
    
    @Published var searchable : String = ""
    @Published var remindersByCategory : [ReminderCategory: [Reminder]] = [.today : [Reminder()],.tommorrow : [],.schedule : [],.completed : []]
   
    func getCategories() -> [ReminderCategory] {
        return remindersByCategory.keys.sorted()
    }
    
    func hasItem(for category: ReminderCategory) -> Bool {
        return !remindersByCategory[category]!.isEmpty
    }
    
    func getItems(for category: ReminderCategory) -> [Reminder] {
        return remindersByCategory[category] ?? []
    }
    
}
