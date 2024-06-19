//
//  ReminderServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore

protocol ReminderRemoteServiceProtocol {
    
    var firestore : Firestore { get }
        
    func filterTasks(reminders: [Int: [Reminder]], by status: ReminderCategory) -> [Reminder]

    func fetch(onCompletion: @escaping (Result<[Int : [Reminder]],ReminderErrorCallback>) -> Void ) throws
    
    func add(_ reminder: Reminder, onCompletion: @escaping (Result<String, ReminderErrorCallback>) -> Void ) throws
}
