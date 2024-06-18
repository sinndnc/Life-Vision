//
//  TimeInterval + Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 18.06.2024.
//

import Foundation

extension TimeInterval{
    
    func formatTimeInterval() -> Countdown {
        let time = NSInteger(self)
        
        let days = time / 86400
        let hours = (time % 86400) / 3600
        let minutes = (time % 3600) / 60
        let seconds = time % 60
        
       return Countdown(day: (days, "Days"), hour: (hours, "Hours"), minute: (minutes, "Minutes"), second: (seconds, "Seconds"))
    }
}
