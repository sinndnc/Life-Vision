//
//  UserLocalService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


final class UserLocalService : UserLocalServiceProtocol{
    
    func set(user : User) {
        UserDefaults.standard.user = user
    }
    
    func fetch() -> User? {
        var user = UserDefaults.standard.user
        user?.image = UserDefaults.standard.image
        return user
    }
    
}
