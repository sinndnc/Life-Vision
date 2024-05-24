//
//  AuthServiceProtcol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation

protocol AuthServiceProtocol{
    
    var auth : FirebaseAuth.Auth { get }

    func auth(_ auth : FirebaseAuth.Auth)

}
