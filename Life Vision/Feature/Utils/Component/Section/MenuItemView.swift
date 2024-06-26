//
//  MenuItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct MenuItemView<T : Hashable> : View {
    
    let menu : [T]
    var item : SectionItem
    @Binding var selected : T
    
    var body: some View {
        Label(
            title: {
                Text(item.label)
                Spacer()
                Menu {
                    if let option = menu.first{
                        Section{
                            Button(action: {
                                selected = option
                            }) {
                                Text("\(option)".capitalized)
                                Spacer()
                                if (selected == option) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }

                    Section{
                        ForEach(menu,id: \.self){ option in
                            if(option != menu.first){
                                Button(action: {
                                    selected = option
                                }) {
                                    Text("\(option)".capitalized)
                                    Spacer()
                                    if (selected == option) {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    }
                } label: {
                    Text("\(selected)".capitalized)
                    Image(systemName: "chevron.up.chevron.down")
                }
                .foregroundColor(.gray)
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

#Preview {
    MenuItemView(
        menu: [],
        item: SectionItem(label: "EarlyReminder", image: "bell",color: .clear),
        selected: .constant("None")
    )
}
