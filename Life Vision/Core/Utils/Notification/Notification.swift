//
//  Notification.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import Foundation
import CoreLocation

struct Notification{
    
    static let MESSAGES = "MESSAGES"
    static let chat_messages = "chat_messages"
    static let group_messages = "group_messages"

    struct message {
        static let id = "MESSAGE"
        static let chat_message = "chat_message"
        static let group_message = "group_message"
    }
    
    struct reminder {
        static let id = "REMINDER"
        static let location_reminder = "location_reminder"
        static let timeInterval_reminder = "timeInterval_reminder"
    }
}


struct LocationNotificaton {
    var title : String
    var content : String
    var location : CLLocationCoordinate2D
    var notifyOnExit : Bool
    var notifyOnEntry : Bool
    var categoryIdentifier : String
}

struct TimeIntervalNotificaton {
    var title : String
    var content : String
    var timeInterval : TimeInterval
    var categoryIdentifier : String
}
