//
//  TimeInterval+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.06.2024.
//

import Foundation


extension TimeInterval{

    var toCountdown : Countdown {
        let totalSeconds = Int(self)
        
        let seconds = totalSeconds % 60
        let minutes = (totalSeconds / 60) % 60
        let hours = (totalSeconds / 3600) % 24
        let days = totalSeconds / 86400
        
        return Countdown(day: days, hour: hours, minute: minutes, second: seconds)
    }
}
