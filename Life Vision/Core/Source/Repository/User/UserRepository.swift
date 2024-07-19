//
//  UserRepository.swift
//  Life Vision
//
//  Created by Sinan Dinç on 29.05.2024.
//

import Foundation


final class UserRepository : UserRepositoryProtocol , ObservableObject {
    
    @Inject private var userLocalService : UserLocalServiceProtocol
    @Inject private var userRemoteService : UserRemoteServiceProtocol
    
    func fetch() async -> Result<User?,UserErrorCallback> {
        do{
            let result = try await userRemoteService.fetch()
            switch(result){
            case .success(let user):
                userLocalService.set(user: user)
                return .success(user)
            case .failure(let error):
                print(error)
                return .failure(error)
            }
        }
        catch {
            print(error)
            let localUser = userLocalService.fetch()
            return .success(localUser)
        }
        
        
    }
    
    
}
