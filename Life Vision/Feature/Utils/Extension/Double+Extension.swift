//
//  Double+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 5.06.2024.
//

import Foundation


extension Double {
    
    func toTimePercentage() -> Double {
        let integerPart = floor(self)
        let fractionalPart = (self - integerPart) / 60 * 100
        let timePercentage = integerPart + fractionalPart
        return timePercentage
    }
    
}
