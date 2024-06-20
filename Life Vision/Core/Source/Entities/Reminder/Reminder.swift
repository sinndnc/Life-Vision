//
//  Task.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation


struct Reminder : Codable , Hashable {
    var uid : String = UUID().uuidString
    var title : String = ""
    var notes : String = ""
    var start_date : Date = .now
    var finish_date : Date = .now
    var `repeat` : String = "Never"
    var early_reminder : String = "None"
    var isCompleted: Bool = false
}
