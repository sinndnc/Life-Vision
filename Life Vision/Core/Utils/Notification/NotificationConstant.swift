//
//  Notification.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import Foundation
import CoreLocation


struct NotificationConstant{   
    
    static let key = "notification_key"

    static let category = "category"
    static let subCategory = "subCategory"
    
    static let messages = "Messages"
    static let group_messages = "Group Messages"
    static let private_messages = "Private Messages"
    
    static let reminders = "Reminders"
    static let location_reminders = "Location Reminders"
    static let scheduled_reminders = "Scheduled Reminders "
    
    static let messagesSubCategories : [SubCategoryItem] = [
        SubCategoryItem(name: group_messages, isAllowed: true),
        SubCategoryItem(name: private_messages, isAllowed: true)
    ]
    
    static let remindersSubCategories : [SubCategoryItem] = [
        SubCategoryItem(name: location_reminders, isAllowed: true),
        SubCategoryItem(name: scheduled_reminders, isAllowed: true)
    ]
    
    static let messagesCategories = CategoryItem(name: messages, isAllowed: true, subCategories: messagesSubCategories)
    static let remindersCategories = CategoryItem(name: reminders, isAllowed: true, subCategories: remindersSubCategories)
    
    static let `default` : [CategoryItem] = [messagesCategories,remindersCategories]
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
    var category: String
    var subCategory: String
}
