//
//  LifeVisionApp.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

@main
struct LifeVisionApp : App {
    
    @Environment(\.colorScheme) private var colorScheme
    @UIApplicationDelegateAdaptor(LifeVisionAppDelegate.self) private var delegate
    @AppStorage(Theme.key) private var theme : Theme = UserDefaults.standard.theme
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(RootViewModel())
                .preferredColorScheme(theme.toColorScheme(colorScheme))
        }
    }
    
}
