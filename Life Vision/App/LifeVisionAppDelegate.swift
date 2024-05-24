//
//  LifeVisionAppDelegate.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import FirebaseCore


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
    
    //TODO: setup initializer
    func setupDependencyContainer() {
        FirebaseApp.configure()
        
    }
    
}
