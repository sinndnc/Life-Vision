//
//  ReminderRepository.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


final class ReminderRepository : ReminderRepositoryProtocol {
    
    
    @Service private var localReminderService : ReminderLocalServiceProtocol
    @Service private var remoteReminderService : ReminderRemoteServiceProtocol

    func fetch(onCompletion: @escaping (Result<[Int : [Reminder]],ReminderErrorCallback>) -> Void ) {
        do{
            try remoteReminderService.fetch(onCompletion: onCompletion)
        }catch ReminderErrorCallback.noConnection {
            print("No connection")
        }catch ReminderErrorCallback.invalidType {
            print("invalidType")
        }catch{
            print(error)
        }
    }
    
    func update(_ reminder : Reminder,onCompletion: @escaping (Result<String,ReminderErrorCallback>) -> Void) {
        do{
            try remoteReminderService.update(reminder, onCompletion: onCompletion)
        }catch ReminderErrorCallback.noConnection {
            print("No connection")
        }catch{
            print(error)
        }
    }

    
    func add(_ reminder: Reminder, onCompletion: @escaping (Result<String, ReminderErrorCallback>) -> Void) {
        do{
            try remoteReminderService.add(reminder, onCompletion: onCompletion)
        }catch ReminderErrorCallback.noConnection {
            print("No connection")
        }catch{
            print(error)
        }
    }
}
