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
    
    static let messages = "messages"
    static let group_messages = "group messages"
    static let private_messages = "private messages"
    
    
    static let reminders = "reminders"
    static let location_reminders = "location reminders"
    static let scheduled_reminders = "scheduled reminders "
    
    static let messagesSubCategories : [SubCategoryItem] = [
        SubCategoryItem(name: "Group Messages", isAllowed: true),
        SubCategoryItem(name: "Private Messages", isAllowed: true)
    ]
    static let remindersSubCategories : [SubCategoryItem] = [
        SubCategoryItem(name: "Location Reminders", isAllowed: true),
        SubCategoryItem(name: "Scheduled Reminders", isAllowed: true)
    ]
    static let messagesCategories = CategoryItem(name: "Messages", isAllowed: true, subCategories: messagesSubCategories)
    static let remindersCategories = CategoryItem(name: "Reminders", isAllowed: true, subCategories: remindersSubCategories)
    
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
