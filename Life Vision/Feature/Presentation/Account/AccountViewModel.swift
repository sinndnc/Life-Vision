//
//  AccountViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject {
    
    @Inject var userRepository : UserRepositoryProtocol
    @Inject var notificationService : NotificationServiceProtocol

    @AppStorage(Theme.key) var theme : Theme = UserDefaults.standard.theme
    @AppStorage(Language.key) var language : Language = UserDefaults.standard.language
    
    @Published var user : User
    
    init(user: User) {
        self.user = user
    }    

}
