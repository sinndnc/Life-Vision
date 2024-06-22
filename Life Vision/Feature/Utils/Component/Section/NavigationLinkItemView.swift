//
//  LabelLinkView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct NavigationLinkDestinationView<Content : View> : View {
    
    
    var item : SectionItem
    var selected : String = ""
    @ViewBuilder let content: Content

    var body: some View {
        NavigationLink(destination: content ) {
            Label(
                title: {
                    Text(item.label)
                    Spacer()
                    Text(selected)
                        .foregroundStyle(.gray)
                },
                icon: { 
                    Image(systemName: item.image)
                        .padding(5)
                        .font(.footnote)
                        .background(item.color)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            )
        }
    }
}


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
                icon: {
                    Image(systemName: item.image)
                        .padding(5)
                        .font(.footnote)
                        .background(item.color)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            )
        }
    }
}


#Preview {
    NavigationLinkItemView(item: SectionItem(label: "Repeat", image: "repeat",color: .cyan), value: AccountDestination.profile)
}
