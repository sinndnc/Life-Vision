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
    
    @Inject private var storageService : StorageRemoteServiceProtocol
            
    
    var isLogged : Bool { return auth.currentUser != nil }
    
    init(auth: FirebaseAuth.Auth,firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func fetch() async throws -> Result<User,UserErrorCallback> {
        
        guard let auth = auth.currentUser else { throw UserErrorCallback.invalidUser }
        
        do{
            let reference = firestore.collection(FirebaseConstant.users).document(auth.uid)
            var user = try await reference.getDocument().data(as: User.self)
            user.image = try await storageService.downloadImage()
                        
            return .success(user)
        }
        catch{
            return .failure(.noConnection)
        }
     
    }
}
