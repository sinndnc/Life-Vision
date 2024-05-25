//
//  StorageServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

protocol StorageServiceProtocol {
 
    var storage : Storage { get }
    var firestore : Firestore { get }
    
    
    func image()
    
    
}
