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
    @StateObject private var viewModel : RootViewModel = RootViewModel()
    @AppStorage(Theme.key) private var theme : Theme = UserDefaults.standard.theme
    @UIApplicationDelegateAdaptor(LifeVisionAppDelegate.self) private var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: viewModel)
                .preferredColorScheme(theme.toColorScheme(colorScheme))
        }
    }
    
}

