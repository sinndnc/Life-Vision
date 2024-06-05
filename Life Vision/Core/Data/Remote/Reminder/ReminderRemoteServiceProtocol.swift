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
    
    func fetch(onCompletion: @escaping (Result<[Reminder],ReminderErrorCallback>) -> Void ) throws 
}
