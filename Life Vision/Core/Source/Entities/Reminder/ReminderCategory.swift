//
//  ReminderGroups.swift
//  Life Vision
//
//  Created by Sinan Dinç on 13.06.2024.
//

import Foundation

enum ReminderCategory : Comparable , Hashable {
    case completed
    case inProgress
    case today
    case tomorrow
    case inWeek
    case scheduled
}
