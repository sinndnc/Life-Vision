//
//  DependencyProperityWrapper.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import Foundation


@propertyWrapper
struct Service<Service> {
    
    var service: Service
    
    init(_ dependencyType: ServiceType = .newInstance) {
        guard let service = ServiceContainer.resolve(dependencyType: dependencyType, Service.self) else {
            fatalError("No dependency of type \(String(describing: Service.self)) registered!")
        }
        self.service = service
    }
    
    var wrappedValue: Service {
        get { self.service }
        mutating set { service = newValue }
    }
}
