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

    @Published private (set) var user : User = UserDefaults.standard.user
    
    init() {
        Task{ @MainActor in
            self.user =  try await userRepository.fetch().get()
                
        }
    }
    

}
