//
//  TaskService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class TaskRemoteService : TaskRemoteServiceProtocol{
    
    let auth : FirebaseAuth.Auth
    let firestore: Firestore
    
    init(auth : FirebaseAuth.Auth,firestore: Firestore) {
        self.auth = auth
        self.firestore = firestore
    }
    
    func fetch() {
        
    }
    
    
    
}
