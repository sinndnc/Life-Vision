//
//  AuthService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseAuth

final class AuthRemoteService : AuthRemoteServiceProtocol {
    
    let auth : FirebaseAuth.Auth
    
    init(auth: FirebaseAuth.Auth) {
        self.auth = auth
    }
    
    func authenticate(_ model : Auth) {
        auth.signIn(withEmail: model.email, password: model.password)
    }
    
}
