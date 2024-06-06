//
//  AccountViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject {
    
    @Service var userRepository : UserRepositoryProtocol
    
    @AppStorage(Theme.key) var theme : Theme = UserDefaults.standard.theme
    @AppStorage(Language.key) var language : Language = UserDefaults.standard.language
    
    @Published private(set) var user : User
    
    init(user: User) {
        self.user = user
    }
    

}
