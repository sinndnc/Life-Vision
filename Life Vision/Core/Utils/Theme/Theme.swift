//
//  Theme.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation


enum Theme : Int , CaseIterable{
    
    case dark
    case light
    case system
    
    static let key : String = "theme"
    
    static let themes : [Theme] = [
        system,
        dark,
        light
    ]
    
}
