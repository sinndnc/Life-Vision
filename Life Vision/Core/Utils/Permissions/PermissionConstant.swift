//
//  PermissionConstant.swift
//  Life Vision
//
//  Created by Sinan Dinç on 14.07.2024.
//

import Foundation

struct PermissionConstant{
    
    
    private static let notifications = PermissionItem(name: "notifications", isAllowed: false)
    
    static let `default` = [notifications]
    
}
