//
//  LifeVisionNotificationDelegate.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import Foundation
import CoreLocation
import UserNotifications

class LifeVisionNotificationDelegate : NSObject, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {
    
    static let shared = LifeVisionNotificationDelegate()
    
    private override init() {
        super.init()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        let category = userInfo[NotificationConstant.category] as! String
        let subCategory = userInfo[NotificationConstant.subCategory] as! String

        print("Notification willPresent with userInfo: \(userInfo)")
        
//        isAllowedCategory(category,subCategory) { result in
//            switch result {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
        // Present the notification alert, sound, and badge even if the app is in the foreground
        completionHandler([.banner, .sound, .badge,])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        print("Notification received with userInfo: \(userInfo)")
        
        completionHandler()
    }
    
    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                UNUserNotificationCenter.current().delegate = self
            //    self.setCategories()
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
//    
//    func isAllowedCategory(_ category : String,_ subCategory: String ,onCompletion: @escaping (Result<Bool,Error>) -> Void) {
//        let notifications = UserDefaults.standard.notifications.decodeToDictionary()
//        
//        UNUserNotificationCenter.current().getNotificationCategories {  categories in
//            
//            let category = notifications.filter { $0.key.category == category }.first
//            if let category = category{
//                if(category.key.isAllowed){
//                    let subCategory = notifications[category.key]?.filter{ $0.key == subCategory }.first
//                    if let subCategory = subCategory{
//                        if(subCategory.value){
//                            onCompletion(.success(true))
//                            print(subCategory.key,subCategory.value ,"is allowed")
//                        }else{
//                            print(subCategory.key,subCategory.value ,"is denied for subCategory")
//                        }
//                    }
//                }
//                else{
//                    print(category.key.category,category.key.isAllowed,"is denied for category")
//                }
//            }
//           
            
            
            
            
//            for notification in notifications.keys.sorted(by: { $0.category > $1.category}) {
//                if(notification.isAllowed){
//                    print("Category is allowed")
//                    let subCategories = notifications[notification] ?? [:]
//                    for subCategory in subCategories{
//                        if(subCategory.value){
//                            print("Sub Category is allowed")
//                            onCompletion(.success(true))
//                        }else{
//                            print("Sub Category is not allowed")
//                            onCompletion(.success(false))
//                        }
//                    }
//                }else{
//                    print("Category is not allowed")
//                    onCompletion(.success(false))
//                }
//            }
//            let filteredCategories = categories.filter { $0.identifier != NotificationConstant.group_messages }
//            UNUserNotificationCenter.current().setNotificationCategories(filteredCategories)
//        }
//    }
    
    private func setCategories() {
        self.setMessagesCategory()
    }
    
    private func setMessagesCategory(){
        let messages = UNNotificationCategory(identifier: NotificationConstant.messages, actions: [], intentIdentifiers: [])
        let group_messages = UNNotificationCategory(identifier: NotificationConstant.group_messages, actions: [], intentIdentifiers: [])
        let private_messages = UNNotificationCategory(identifier: NotificationConstant.private_messages, actions: [], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([messages,group_messages,private_messages])
    }
    
}
