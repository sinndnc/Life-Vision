//
//  SegmentedItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 7.06.2024.
//

import SwiftUI

struct SegmentedItemView<T : Hashable> : View {
    
    let menu : [T]
    var item : SectionItem
    @Binding var selected : T
    
    var body: some View {
        
        Label(
            title: {
                Text(item.label)
                Spacer()
                Picker("",selection: $selected) {
                    ForEach(menu,id:\.self) { item in
                        Text("\(item)")
                    }
                }
                .pickerStyle(.segmented)
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
    SegmentedItemView(
        menu: Theme.themes,
        item: AccountSectionConstant.theme,
        selected: .constant(.light)
    )
}
