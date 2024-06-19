//
//  Date+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import Foundation


extension Date {

    var getDayNameOfMonth : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ccc"
        return dateFormatter.string(from: self)
    }
    
    func toHour() -> Double {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        
        let fractional = Double(minute) / 100.0
        let wholePart = Double(hour) + fractional
        return wholePart
    }
    
    var convertHourPercentage : Double { self.toHour().toTimePercentage() }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }

    var isInWeek: Bool {
        guard let endOfWeek = Calendar.current.date(byAdding: .day, value: 7, to: Date()) else {
            return false
        }
        return self < endOfWeek
    }
    
    func getThisMonthSpecificDay(day : Int) -> Date {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 0
        components.day += day
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    func getLast6Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -6, to: self)
    }

    func getLast3Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -3, to: self)
    }

    func getYesterday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }

    func getLast7Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    func getLast30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)
    }

    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }

    // This Month Start
    func getThisMonthStart() -> Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }

    func getThisMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }

    //Last Month Start
    func getLastMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }

    //Last Month End
    func getLastMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }

    //3 Months End
    func getLast3MonthsEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 2
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }

    //6 Months Start
    func getLast6MonthsStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 6
        return Calendar.current.date(from: components as DateComponents)!
    }

    //6 Months End
    func getLast6MonthsEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 5
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }

}
