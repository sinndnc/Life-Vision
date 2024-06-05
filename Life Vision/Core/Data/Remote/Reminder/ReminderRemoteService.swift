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
        var reminders : [Reminder] = []
        guard let user = auth.currentUser else { throw UserErrorCallback.invalidUser }
        firestore.collection(FirebaseConstant.users)
            .document(user.uid)
            .collection(FirebaseConstant.reminders)
            .addSnapshotListener { snapshot, error in
                if let snapshot = snapshot{
                    for document in snapshot.documents{
                        do{
                            let reminder = try document.data(as: Reminder.self)
                            reminders.append(reminder)
                        }
                        catch is ReminderErrorCallback{
                            print(error)
                        }
                        catch{
                            print(error.localizedDescription)
                        }
                    }
                    return onCompletion(.success(reminders))
                }
            }
    }
    
}
