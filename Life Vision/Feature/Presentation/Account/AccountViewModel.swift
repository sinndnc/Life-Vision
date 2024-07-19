//
//  AccountViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject {
    
    @Published var user : User?

    @Inject var userRepository : UserRepositoryProtocol
    @Inject var notificationService : NotificationServiceProtocol

    @AppStorage(Theme.key) var theme : Theme = UserDefaults.standard.theme
    @AppStorage(Language.key) var language : Language = UserDefaults.standard.language

    init(user: User?) {
        self.user = user
    }

    func saveCategories(_ categories : [CategoryItem]) {
        do{
            let encoded = try JSONEncoder().encode(categories)
            UserDefaults.standard.setValue(encoded, forKey: Preferences.categories)
        }catch{
            print("error:",error)
        }
    }
    
}
