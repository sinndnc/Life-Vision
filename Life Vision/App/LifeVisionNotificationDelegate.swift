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
        
        isAllowed(category,subCategory) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
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

    private func isAllowed(_ category : String,_ subCategory : String,onCompletion: (Result<Bool,UserErrorCallback>) -> Void ) {
        
        let categories = UserDefaults.standard.categories
        
        let selectedCategory = categories.filter { $0.name == category }.first
        
        if let selectedCategory = selectedCategory {
            let selectedSubCategory = selectedCategory.subCategories.filter{ $0.name == subCategory}.first
            if let selectedSubCategory = selectedSubCategory {
                if( selectedCategory.isAllowed && selectedSubCategory.isAllowed ){
                    return onCompletion(.success(true))
                }
                return onCompletion(.failure(.noConnection))
            }
        }
    }
}
