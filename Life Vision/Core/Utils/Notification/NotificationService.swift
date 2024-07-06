//
//  NotificationService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 10.06.2024.
//

import Foundation
import UserNotifications
import CoreLocation

final class NotificationService : NotificationServiceProtocol {
    
    func setCategories() {
        let messages = UNNotificationCategory(identifier: Notification.message.id, actions: [], intentIdentifiers: [])
        let reminders = UNNotificationCategory(identifier:Notification.reminder.id, actions: [], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([messages,reminders])
    }
    
    func scheduleLocationNotification(_ notification : LocationNotificaton) {
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.content
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = notification.categoryIdentifier
        
        let region = CLCircularRegion(center: notification.location, radius: 100, identifier: "AppleHQ")
        region.notifyOnEntry = notification.notifyOnEntry
        region.notifyOnExit = notification.notifyOnExit

        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling location notification: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleTimeIntervalNotification(_ notification : TimeIntervalNotificaton) {
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.content
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = notification.categoryIdentifier
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notification.timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling time interval notification: \(error.localizedDescription)")
            }
        }
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.  sdvfdsvdfb")
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func initializeNotificationCategories() -> [String: [String:Bool]] {
        var notifications : [String: [String:Bool]] = [:]

        let keys = [Notification.MESSAGES]
        let subkeys = [Notification.chat_messages,Notification.group_messages]
        
        for key in keys {
            if notifications[key] == nil {
                notifications[key] = [:]
            }
            for subkey in subkeys {
                notifications[key]![subkey] = true
            }
        }
        
        return notifications
    }
    
    
}
