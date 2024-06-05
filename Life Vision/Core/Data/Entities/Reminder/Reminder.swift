//
//  Task.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation


struct Reminder : Codable , Hashable {
    var title : String
    var start_date : Date
    var finish_date : Date
}
