//
//  User.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation

struct User : Codable {
    
    var mail : String
    var name : String
    var surname : String
    
    
    static let key = "user"
    
    static func logout() {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
