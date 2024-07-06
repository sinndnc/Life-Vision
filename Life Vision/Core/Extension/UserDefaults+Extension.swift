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
    
    //TODO: düzeltilecek
    var image : Data {
        get {
            UserDefaults.standard.data(forKey: Preferences.image) ?? Data()
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Preferences.image)
        }
    }
    
    var user : User{
        get{
            let defaultUser = User(mail: "default@mail.com", name: "default", surname: "")
            let userData = UserDefaults.standard.value(forKey: User.key) as? Data ?? Data()
            let user = try? PropertyListDecoder().decode(User.self, from: userData)
            return user ?? defaultUser
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.set(data,forKey: User.key)
            }
        }
    }
       
    var notification : Bool {
        get{
            return UserDefaults.standard.bool(forKey: Preferences.notification)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Preferences.notification)
        }
    }
    
    var notifications : Data {
        get{
            return UserDefaults.standard.data(forKey: Preferences.notifications) ?? Data()
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Preferences.notifications)
        }
    }
}
