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
        
        ServiceContainer.register(type: AuthServiceProtocol.self, AuthService(auth: auth))
        ServiceContainer.register(type: UserServiceProtocol.self, UserService(auth: auth,firestore: firestore))
        ServiceContainer.register(type: TaskServiceProtocol.self, TaskService(auth: auth,firestore: firestore))
        ServiceContainer.register(type: StorageServiceProtocol.self, StorageService(storage: storage, firestore: firestore))
    }
    
}
