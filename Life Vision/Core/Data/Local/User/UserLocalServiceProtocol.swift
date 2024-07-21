//
//  UserLocalServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


protocol UserLocalServiceProtocol{
    
    func set(user : User)
    
    func fetch()  -> User?
    
}
