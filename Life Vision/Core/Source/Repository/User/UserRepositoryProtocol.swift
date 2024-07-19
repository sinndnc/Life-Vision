//
//  UserRepositoryProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


protocol UserRepositoryProtocol {
    

    func fetch() async -> Result<User?,UserErrorCallback>
    
}
