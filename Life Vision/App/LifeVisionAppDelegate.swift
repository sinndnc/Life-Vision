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
        
        
        //Calendar
        ServiceContainer.register(type: CalendarServiceProtocol.self, CalendarService())

        
        ServiceContainer.register(type: AuthRemoteServiceProtocol.self, AuthRemoteService(auth: auth))
        //User
        ServiceContainer.register(type: UserRepositoryProtocol.self, UserRepository())
        ServiceContainer.register(type: UserLocalServiceProtocol.self, UserLocalService())
        ServiceContainer.register(type: UserRemoteServiceProtocol.self, UserRemoteService(auth: auth,firestore: firestore))
        //Task
        ServiceContainer.register(type: TaskRepositoryProtocol.self, TaskRepository())
        ServiceContainer.register(type: TaskLocalServiceProtocol.self, TaskLocalService())
        ServiceContainer.register(type: TaskRemoteServiceProtocol.self, TaskRemoteService(auth: auth,firestore: firestore))
        //Storage
        ServiceContainer.register(type: StorageRemoteServiceProtocol.self, StorageRemoteService(auth: auth, storage: storage, firestore: firestore))
    }
    
}
