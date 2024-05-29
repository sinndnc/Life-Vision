//
//  StorageService.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

final class StorageRemoteService : StorageRemoteServiceProtocol{
    
    let storage: Storage
    let firestore: Firestore
    let auth : FirebaseAuth.Auth

    @AppStorage(Preferences.image) private var image : Data = UserDefaults.standard.image
    
    init(auth : FirebaseAuth.Auth,storage: Storage, firestore: Firestore) {
        self.auth = auth
        self.storage = storage
        self.firestore = firestore
    }
    
    func downloadImage() {
        let maxSize : Int64 = 1 * 1024 * 1024
        let reference = storage.reference(withPath: "images/\(auth.currentUser!.uid)/profile_image.jpg")
        
        reference.getData(maxSize: maxSize ) { data, error  in
            if let error = error { print(error) }
            
            if let data = data { self.image = data }
        }
        
    }
    
    
    func uploadImage(){
        
    }
    
    
    
}
