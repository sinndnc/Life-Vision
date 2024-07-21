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
    
    init(auth : FirebaseAuth.Auth,storage: Storage, firestore: Firestore) {
        self.auth = auth
        self.storage = storage
        self.firestore = firestore
    }
    
    func downloadImage() async throws -> Data {
        let maxSize : Int64 = 1 * 1024 * 1024
        
        guard let user = auth.currentUser else { throw UserErrorCallback.invalidUser }
        let reference = storage.reference(withPath: "images/\(user.uid)/profile_image.jpg")
        
        do {
            return try await reference.data(maxSize: maxSize)
        } catch {
            print(error)
            return Data()
        }
    }
    
    func uploadImage(){
        
    }
    
}
