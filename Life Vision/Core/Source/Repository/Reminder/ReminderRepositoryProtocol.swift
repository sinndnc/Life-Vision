//
//  ReminderRepositoryProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation

protocol ReminderRepositoryProtocol {
    
    func fetch(onCompletion: @escaping (Result<[Int : [Reminder]],ReminderErrorCallback>) -> Void )
        
    func filterTasks(reminders: [Int: [Reminder]], by status: ReminderCategory) -> [Reminder]
    
    func add(_ reminder : Reminder,onCompletion : (@escaping (Result<String,ReminderErrorCallback>) -> Void))
    
}
