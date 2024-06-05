//
//  CalendarService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 3.06.2024.
//

import Foundation

struct Day {
    var name : String
    var number : Int
}

final class CalendarService : CalendarServiceProtocol {
    
    var date: Date = .now
    
    var calendar: Calendar = .current
    
    var getCurentDay : Day {
        let components = calendar.dateComponents([.day], from: date)
        let name = date.getThisMonthSpecificDay(day: components.day!).getDayNameOfMonth
        return Day(name: name, number: components.day!)
    }
    
}
