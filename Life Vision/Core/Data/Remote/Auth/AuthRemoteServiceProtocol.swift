//
//  AuthServiceProtcol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseAuth

protocol AuthRemoteServiceProtocol{
    
    var auth : FirebaseAuth.Auth { get }

    func authenticate(_ auth : Auth)

}
