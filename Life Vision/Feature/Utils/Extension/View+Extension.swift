//
//  View+Extension.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

extension View {
    
    func localizedNavigationTitle(title : String) -> some View {
        navigationTitle(LocalizedStringKey(title))
    }
  
}
