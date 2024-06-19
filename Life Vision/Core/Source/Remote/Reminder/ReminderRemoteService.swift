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
    
    func fetch(onCompletion: @escaping (Result<[Int : [Reminder]],ReminderErrorCallback>) -> Void ) throws {
        guard let user = auth.currentUser else { throw UserErrorCallback.invalidUser }

        var reminders : [Reminder] = []
        var classifiedReminders : [Int : [Reminder]] = [:]

        firestore.collection(FirebaseConstant.users)
            .document(user.uid)
            .collection(FirebaseConstant.reminders)
            .addSnapshotListener { snapshot, error in
                if let snapshot = snapshot{
                    do{
                        reminders.removeAll()
                        classifiedReminders.removeAll()
                        for document in snapshot.documents{
                            let reminder = try document.data(as: Reminder.self)
                            reminders.append(reminder)
                        }
                        classifiedReminders = self.classifyRemindersByDay(reminders: reminders)
                        onCompletion(.success(classifiedReminders))
                     }
                    catch is ReminderErrorCallback{
                        print(error?.localizedDescription ?? "no user")
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
    
    private func classifyRemindersByDay(reminders : [Reminder]) -> [Int: [Reminder]] {
        
        var classifiedReminders: [Int: [Reminder]] = [:]
        
        for reminder in reminders {
            let day = Calendar.current.component(.day, from: reminder.start_date)
            if classifiedReminders[day] != nil {
                classifiedReminders[day]?.append(reminder)
            } else {
                classifiedReminders[day] = [reminder]
            }
        }
        
        return classifiedReminders
    }
    
    
    func filterTasks(reminders: [Int: [Reminder]], by status: ReminderCategory) -> [Reminder] {
        
        let flattedReminders = reminders.flatMap { $0.value }
        
        return flattedReminders.filter { reminder in
            switch status {
            case .inProgress:
                return inProgress(reminder.start_date,reminder.finish_date)
            case .today:
                return reminder.start_date.isToday
            case .tomorrow:
                return  reminder.start_date.isTomorrow
            case .inWeek:
                return reminder.start_date.isInWeek
            case .scheduled:
                return reminder.start_date > .now
            case .completed:
                return reminder.finish_date < .now
            }
        }
    }
    
    private func inProgress(_ start_date: Date,_ finish_date : Date) -> Bool {
        return start_date < .now  && .now < finish_date
    }
    
}
