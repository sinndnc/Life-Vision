//
//  ReminderRemoteService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ReminderRemoteService : ReminderRemoteServiceProtocol{
    
    let auth : FirebaseAuth.Auth
    let firestore: Firestore
    
    init(auth : FirebaseAuth.Auth,firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func fetch(onCompletion: @escaping (Result<[Reminder],ReminderErrorCallback>) -> Void ) throws {
        guard let user = auth.currentUser else { throw UserErrorCallback.invalidUser }
        
        firestore.collection(FirebaseConstant.users)
            .document(user.uid)
            .collection(FirebaseConstant.reminders)
            .addSnapshotListener { snapshot, error in
                if let snapshot = snapshot{
                    do{
                        var reminders : [Reminder] = []
                        for document in snapshot.documents{
                            let reminder = try document.data(as: Reminder.self)
                            reminders.append(reminder)
                            onCompletion(.success(reminders))
                        }
                     }
                    catch is ReminderErrorCallback{
                        print(error)
                        onCompletion(.failure(ReminderErrorCallback.noUser))
                    }
                    catch{
                        print(error.localizedDescription)
                        onCompletion(.failure(ReminderErrorCallback.noUser))
                    }
                }
            }
    }
    
    func add(_ reminder: Reminder, onCompletion: @escaping (Result<String, ReminderErrorCallback>) -> Void) throws {
        guard let user = auth.currentUser else { throw UserErrorCallback.invalidUser }
        
        do{
           let response = try firestore.collection(FirebaseConstant.users)
                .document(user.uid)
                .collection(FirebaseConstant.reminders)
                .addDocument(from: reminder){ result in
                    if let error = result{
                        onCompletion(.failure(.invalidType))
                        print(error.localizedDescription)
                    }
                }
            
            onCompletion(.success(response.documentID))
        }catch{
            onCompletion(.failure(.invalidType))
        }
            
    }
    
}
