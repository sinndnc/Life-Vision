//
//  NotificationServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 10.06.2024.
//

import Foundation
import UserNotifications

protocol NotificationServiceProtocol{
        
    func scheduleLocationNotification()

    func scheduleTimeIntervalNotification()
    
    func requestAuthorization()

}
