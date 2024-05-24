//
//  Life_VisionApp.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

@main
struct LifeVisionApp: App {
    
    @UIApplicationDelegateAdaptor(LifeVisionAppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
