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
    
    func fetch() async throws -> Result<User,UserErrorCallback> {
        
        guard let auth = auth.currentUser else { throw UserErrorCallback.invalidUser }
        
        do{
            let user = try await firestore.collection(FirebaseConstant.users)
                .document(auth.uid)
                .getDocument()
                .data(as: User.self)
            return .success(user)
        }
        catch{
            return .failure(.noConnection)
        }
     
    }
}
