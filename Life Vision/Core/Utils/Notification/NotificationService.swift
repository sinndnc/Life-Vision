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
    
    func scheduleLocationNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Location Reminder"
        content.body = "You have arrived at your destination."
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "MEETING_CATEGORY"

        let center = CLLocationCoordinate2D(latitude: 37.334722, longitude: -122.008889)
        let region = CLCircularRegion(center: center, radius: 100, identifier: "AppleHQ")
        region.notifyOnEntry = true
        region.notifyOnExit = false

        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling location notification: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleTimeIntervalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Interval Reminder"
        content.body = "This is a reminder that triggers after a set time interval."
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "MEETING_CATEGORY"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
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
    
    
    
}
