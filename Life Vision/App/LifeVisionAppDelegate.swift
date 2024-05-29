//
//  LifeVisionAppDelegate.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class LifeVisionAppDelegate : NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        setupDependencyContainer()
        
        return true
    }
    
}

extension LifeVisionAppDelegate : UNUserNotificationCenterDelegate{
    
    func setupDependencyContainer() {
        FirebaseApp.configure()
        
        let storage = Storage.storage()
        let auth = FirebaseAuth.Auth.auth()
        let firestore = Firestore.firestore()
        
        ServiceContainer.register(type: AuthRemoteServiceProtocol.self, AuthService(auth: auth))
        ServiceContainer.register(type: UserRemoteServiceProtocol.self, UserRemoteService(auth: auth,firestore: firestore))
        ServiceContainer.register(type: TaskRemoteServiceProtocol.self, TaskRemoteService(auth: auth,firestore: firestore))
        ServiceContainer.register(type: StorageServiceProtocol.self, StorageService(auth: auth, storage: storage, firestore: firestore))
    }
    
}
