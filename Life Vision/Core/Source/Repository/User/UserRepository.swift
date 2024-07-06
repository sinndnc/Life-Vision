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
    
    func fetch() async -> Result<User,UserErrorCallback> {
        do{
            let result = try await userRemoteService.fetch()
            switch(result){
            case .success(let user):
                return .success(user)
            case .failure(let error):
                return .failure(error)
            }
        }
        catch {
            let localUser = userLocalService.fetch()
            return .success(localUser)
        }
        
        
    }
    
    
}
