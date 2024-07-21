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
    var image : Data? = nil
    
    static func logout() {
        UserDefaults.standard.removeObject(forKey: Preferences.user)
    }
    
}
