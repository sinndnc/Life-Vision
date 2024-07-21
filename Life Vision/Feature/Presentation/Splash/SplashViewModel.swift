//
//  SplashViewModel.swift
//  Life Vision
//
//  Created by Sinan Dinç on 21.07.2024.
//

import Foundation

final class SplashViewModel : ObservableObject{
    
    @Inject private var userRepository : UserRepositoryProtocol
    
    func isLogged() -> Bool {
        if userRepository.isLogged {
            return true
        }else{
            return false
        }
    }
    
}
