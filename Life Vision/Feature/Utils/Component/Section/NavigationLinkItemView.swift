//
//  LabelLinkView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct NavigationLinkItemView: View {
    
    var item : SectionItem
    var value : any Hashable
    var selected : String = ""
    
    var body: some View {
        NavigationLink(value: value) {
            Label(
                title: {
                    Text(item.label)
                    Spacer()
                    Text(selected)
                        .foregroundStyle(.gray)
                },
                icon: { Image(systemName: item.image) }
            )
            
        }
    }
}

#Preview {
    NavigationLinkItemView(item: SectionItem(label: "Repeat", image: "repeat"), value: AccountDestination.profile)
}
