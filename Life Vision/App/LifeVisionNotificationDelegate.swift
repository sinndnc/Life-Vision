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
        print("Notification willPresent with userInfo: \(userInfo)")
                
        // Present the notification alert, sound, and badge even if the app is in the foreground
        completionHandler([.banner, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       
        let userInfo = response.notification.request.content.userInfo
        print("Notification received with userInfo: \(userInfo)")
                
        // Present the notification alert, when app is on background
        completionHandler()
    }
    
    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                UNUserNotificationCenter.current().delegate = self
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
}
