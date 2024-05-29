//
//  TaskServiceProtocol.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation
import FirebaseFirestore

protocol TaskRemoteServiceProtocol {
    
    var firestore : Firestore { get }
    
    func fetch()
}
