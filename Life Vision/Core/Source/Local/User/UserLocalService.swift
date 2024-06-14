//
//  UserLocalService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


final class UserLocalService : UserLocalServiceProtocol{
    
    
    func fetch() -> User {
       return UserDefaults.standard.user
        
        
        
    }
    
    
}
