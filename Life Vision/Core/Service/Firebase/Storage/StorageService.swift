//
//  StorageService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

final class StorageService : StorageServiceProtocol{
    
    let storage: Storage
    let firestore: Firestore
    
    init(storage: Storage, firestore: Firestore) {
        self.storage = storage
        self.firestore = firestore
    }
    
    func downloadImage() {
        
    }
    
    
    func uploadImage(){
        
    }
    
    
    
}
