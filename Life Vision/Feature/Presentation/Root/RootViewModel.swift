//
//  RootViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class RootViewModel : ObservableObject{
    
    @Service var authService : AuthRemoteServiceProtocol
    @Service var userRepository : UserRepositoryProtocol
    @Service var storageService : StorageRemoteServiceProtocol
    @Service var reminderRepository : ReminderRepositoryProtocol

    @Published private (set) var user : User = UserDefaults.standard.user
    
    init() {
        Task{ @MainActor in
            let result = await userRepository.fetch()
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
