//
//  UserService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


final class UserRemoteService : UserRemoteServiceProtocol {
    
    let firestore: Firestore
    let auth : FirebaseAuth.Auth
        
    init(auth: FirebaseAuth.Auth,firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func fetch() async throws -> User? {
        if let user = auth.currentUser{
            let user = try await firestore.collection(FirebaseConstant.users)
                .document(user.uid)
                .getDocument()
                .data(as: User.self)
            return user
        }else {
            return nil
        }
    }
    
    
}
