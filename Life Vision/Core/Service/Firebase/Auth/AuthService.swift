//
//  AuthService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseAuth

final class AuthService : AuthServiceProtocol {
    
    var auth : FirebaseAuth.Auth
    
    init(auth: FirebaseAuth.Auth) {
        self.auth = auth
    }
    
    func auth(_ auth : FirebaseAuth.Auth){
        
    }
    
}
