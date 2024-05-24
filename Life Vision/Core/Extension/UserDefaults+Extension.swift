//
//  UserDefaults+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

extension UserDefaults {
    
    var theme : Theme {
        get{
            Theme(rawValue: UserDefaults.standard.integer(forKey: Theme.key)) ?? .system
        }
        set{
            UserDefaults.standard.set(newValue.rawValue, forKey: Theme.key)
            synchronize()
        }
    }
    
    var language : Language {
        get{
            Language(rawValue: UserDefaults.standard.integer(forKey: Language.key)) ?? .english
        }
        set{
            UserDefaults.standard.set(newValue.rawValue, forKey: Language.key)
            synchronize()
        }
    }
    
}
