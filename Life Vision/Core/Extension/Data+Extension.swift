//
//  Data+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 7.07.2024.
//

import Foundation

extension Data {
    
    func decodeToDictionary() -> [String: [String: Bool]] {
        do {
            return try JSONDecoder().decode([String: [String: Bool]].self, from: self)
        } catch {
            let defaultDictionary = [
                "Messages": ["Group": true, "Private": false],
                "Reminders": ["Location": false, "Timeinterval": true]
            ]
            return defaultDictionary
        }
    }
    
    
}
