//
//  RootViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class RootViewModel : ObservableObject{
  
    @Published var user : User? = nil
    
    @Inject var authService : AuthRemoteServiceProtocol
    @Inject var userRepository : UserRepositoryProtocol
    @Inject var storageService : StorageRemoteServiceProtocol
    @Inject var reminderRepository : ReminderRepositoryProtocol
    @Inject var notificationService : NotificationServiceProtocol
    
    init() {
        Task { @MainActor in
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
