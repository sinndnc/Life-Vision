//
//  ReminderRepository.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


final class ReminderRepository : ReminderRepositoryProtocol{
    
    @Service private var localReminderService : ReminderLocalServiceProtocol
    @Service private var remoteReminderService : ReminderRemoteServiceProtocol

    func fetch(onCompletion: @escaping (Result<[Reminder], ReminderErrorCallback>) -> Void) {
        do{
            try remoteReminderService.fetch(onCompletion: onCompletion)
        }catch is ReminderErrorCallback {
            
        }catch{
            
        }
    }
    
    func add(_ reminder: Reminder, onCompletion: @escaping (Result<String, ReminderErrorCallback>) -> Void) {
        do{
            try remoteReminderService.add(reminder, onCompletion: onCompletion)
        }catch is ReminderErrorCallback{
            
        }catch{
            
        }
    }
    
    
}
