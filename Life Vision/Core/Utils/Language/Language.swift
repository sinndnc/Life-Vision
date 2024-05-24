//
//  Language.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

enum Language : Int , CaseIterable{
    
    case turkish
    case english
    case espanyol
    case itilian
    case french
    
    static let key = "language"
    
    static let languages = [
        turkish,
        english,
        espanyol,
        itilian,
        french
    ]
    
}

extension Language{
    
    var toString : String { "\(self)".capitalized }
    
    var toShortVerb : String {
        return switch self{
        case .english:
            "en"
        case .turkish:
            "tr"
        case .espanyol:
            "es"
        case .itilian:
            "it"
        case .french:
            "fr"
        }
    }
}
