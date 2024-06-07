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
    
    @Published var reminder : Reminder = Reminder()


    @Published var isPresented : Bool = false
    
}
