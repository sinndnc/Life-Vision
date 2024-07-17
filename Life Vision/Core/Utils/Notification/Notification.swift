//
//  Notification.swift
//  Life Vision
//
//  Created by Sinan Dinç on 7.07.2024.
//

import Foundation
import SwiftUI


struct CategoryItem : Hashable , Codable{
    var name : String
    var isAllowed : Bool
    var subCategories : [SubCategoryItem]
}

struct SubCategoryItem : Hashable , Codable{
    var name : String
    var isAllowed : Bool
}
