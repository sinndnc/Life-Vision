//
//  ReminderRepositoryProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation

protocol ReminderRepositoryProtocol {
    
    func fetch(onCompletion: @escaping (Result<[Reminder],ReminderErrorCallback>) -> Void )
    
}
