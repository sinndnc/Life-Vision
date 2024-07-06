//
//  RootViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class RootViewModel : ObservableObject{
    
    @Inject var authService : AuthRemoteServiceProtocol
    @Inject var userRepository : UserRepositoryProtocol
    @Inject var storageService : StorageRemoteServiceProtocol
    @Inject var reminderRepository : ReminderRepositoryProtocol
    @Inject var notificationService : NotificationServiceProtocol
    
    @Published var user : User = UserDefaults.standard.user
    
    init() {
        notificationService.setCategories()
    }
    
}
