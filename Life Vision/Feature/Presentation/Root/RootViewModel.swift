//
//  RootViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation

final class RootViewModel : ObservableObject{
    
    @Service var authService : AuthRemoteServiceProtocol
    @Service var userService : UserRemoteServiceProtocol
    @Service var storageService : StorageServiceProtocol

    @Published private (set) var user : User? = UserDefaults.standard.user
    
    init() {
        Task{ @MainActor in 
            self.user = try await userService.fetch()
        }
    }
    

}
