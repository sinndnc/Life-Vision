//
//  UserServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol UserRemoteServiceProtocol{
        
    var isLogged : Bool { get }

    var firestore: Firestore { get }
    
    var auth : FirebaseAuth.Auth { get }

    func fetch() async throws ->  Result<User,UserErrorCallback>
    
}
