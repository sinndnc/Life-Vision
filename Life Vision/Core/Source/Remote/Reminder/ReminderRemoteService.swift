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
    
    
    func classifyRemindersByDay(reminders : [Reminder]) -> [Int: [Reminder]] {
        
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
        
//        var sortedClassifiedReminders = classifiedReminders.keys.sorted()
//        
//        for day in sortedClassifiedReminders {
//            if let remindersForDay = classifiedReminders[day] {
//                print("Gün: \(day)")
//                for reminder in remindersForDay {
//                    print("Etkinlik: \(reminder.title), Tarih: \(reminder.start_date)")
//                }
//            }
//        }
    }
    
    
    func filterByDate(_ timestamps : [Timestamp]) {
        var yesterday: [Date] = []
        var today: [Date] = []
        var tomorrow: [Date] = []
        var inWeekend : [Date] = []
         
        let calendar = Calendar.current
           
        for timestamp in timestamps {
            let date = timestamp.dateValue()
            if calendar.isDateInYesterday(date) {
                yesterday.append(date)
            } else if calendar.isDateInToday(date) {
                today.append(date)
            } else if calendar.isDateInTomorrow(date) {
                tomorrow.append(date)
            }else if calendar.isDateInWeekend(date){
                inWeekend.append(date)
            }
        }
           
    }
    
}
