//
//  TimeInterval+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.06.2024.
//

import Foundation


extension TimeInterval{
    
    func toCountDown() -> Countdown{
        let totalSeconds = Int(self)
        let days = totalSeconds / (24 * 3600)
        let remainingAfterDays = totalSeconds % (24 * 3600)
        let hours = remainingAfterDays / 3600
        let remainingAfterHours = remainingAfterDays % 3600
        let minutes = remainingAfterHours / 60
        let seconds = remainingAfterHours % 60
            
        return Countdown(day: (days,"days"), hour: (hours,"Hours"), minute: (minutes,"Minutes"), second: (seconds,"Seconds"))
    }
    
}
