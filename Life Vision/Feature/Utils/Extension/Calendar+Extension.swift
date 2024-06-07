//
//  Calendar+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import Foundation

extension Calendar {
    
    var getDaysOfMonth : Int {
        let range = self.range(of: .day, in: .month, for: .now)!
        let daysOfMonth = range.count
        return daysOfMonth
    }
    
    
    
}

