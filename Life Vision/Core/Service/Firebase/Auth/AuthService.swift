//
//  AuthService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseAuth

final class AuthService : AuthServiceProtocol {
    
    let auth : FirebaseAuth.Auth
    
    init(auth: FirebaseAuth.Auth) {
        self.auth = auth
    }
    
    func authenticate(_ model : Auth){
        auth.signIn(withEmail: model.email, password: model.password){ completion , error  in
            print(completion?.user.uid)
        }
    }
    
}
