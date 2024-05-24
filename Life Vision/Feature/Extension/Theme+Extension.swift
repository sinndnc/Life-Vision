//
//  ColorScheme+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI


extension Theme {
    
    func toColorScheme(_ colorScheme : ColorScheme) -> ColorScheme {
        return switch self {
        case .light:
            .light
        case .dark:
            .dark
        case .system:
            colorScheme == .dark ? .dark : .light
        }
    }
}
