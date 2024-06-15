//
//  Notification.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import Foundation
import CoreLocation


struct LocationNotificaton {
    var title : String
    var content : String
    var notifyOnExit : Bool
    var notifyOnEntry : Bool
    var categoryIdentifier : String
    var location : CLLocationCoordinate2D
}

struct TimeIntervalNotificaton {
    var title : String
    var content : String
    var categoryIdentifier : String
    var timeInterval : TimeInterval
}
