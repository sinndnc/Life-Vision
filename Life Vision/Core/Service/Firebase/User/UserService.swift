//
//  UserService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore


final class UserService : UserServiceProtocol {
    
    var firestore: Firestore
    
    init(firestore: Firestore) {
        self.firestore = firestore
    }
    
    func fetch() {
        
    }
    
    
}
