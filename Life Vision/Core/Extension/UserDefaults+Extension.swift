//
//  UserDefaults+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

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
    var image : Data? {
        get {
            UserDefaults.standard.data(forKey: Preferences.image)
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Preferences.image)
        }
    }
    
    var user : User?{
        get{
            if let data = self.data(forKey: Preferences.user){
                do {
                    let user = try PropertyListDecoder().decode(User.self, from: data)
                    return user
                }
                catch{ print("encoded error : \(error)") }
            }
            return nil
        }
        set{
            do{
                let encoded = try JSONEncoder().encode(newValue)
                self.setValue(encoded, forKey: Preferences.user)
            }
            catch{ print("encoded error : \(error)") }
        }
    }
    
    
    var permissions : Binding<[PermissionItem]> {
        Binding{
            if let data = self.data(forKey: Preferences.permissions) {
                do {
                    let permissions = try JSONDecoder().decode([PermissionItem].self, from: data)
                    return permissions
                }
                catch { print("decoded error : \(error)") }
            }else{
                do{
                    let `default` = try JSONEncoder().encode(PermissionConstant.default)
                    self.setValue(`default`, forKey: Preferences.permissions)
                }
                catch{ print("encoded error : \(error)") }
            }
            return PermissionConstant.default
        }
        set: { newValue in
            do{
                let encoded = try JSONEncoder().encode(newValue)
                self.setValue(encoded, forKey: Preferences.permissions)
            }
            catch{ print("encoded error : \(error)") }
        }
    }

    var categories : [CategoryItem] {
        get{
            if let data = self.data(forKey: Preferences.categories) {
                do {
                    let notifications = try JSONDecoder().decode([CategoryItem].self, from: data)
                    return notifications
                }
                catch { print("decoded error : \(error)") }
            }else{
                do{
                    let `default` = try JSONEncoder().encode(NotificationConstant.default)
                    self.setValue(`default`, forKey: Preferences.categories)
                }
                catch{ print("encoded error : \(error)") }
            }
            return NotificationConstant.default
        }
        set{
            do{
                let encoded = try JSONEncoder().encode(newValue)
                self.setValue(encoded, forKey: Preferences.categories)
            }
            catch{ print("encoded error : \(error)") }
        }
    }

}
