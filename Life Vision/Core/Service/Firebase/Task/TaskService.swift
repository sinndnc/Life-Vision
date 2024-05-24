//
//  TaskService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore

final class TaskService : TaskServiceProtocol{
    
    var firestore: Firestore
    
    init(firestore: Firestore) {
        self.firestore = firestore
    }
    
    func fetch() {
        
    }
    
    
    
}
