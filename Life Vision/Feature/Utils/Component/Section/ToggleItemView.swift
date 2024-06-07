//
//  ToggleItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ToggleItemView: View {
    
    @Binding var isOn : Bool
    var item : SectionItem
    
    var body: some View {
        Toggle(isOn: $isOn, label: {
            Label(
                title: { Text(item.label) },
                icon: { Image(systemName: item.image) }
            )
        })
    }
}

#Preview {
    ToggleItemView(isOn: .constant(false), item: SectionItem(label: "Theme", image: "globe"))
}
