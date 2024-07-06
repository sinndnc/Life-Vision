//
//  DisclosureGroupView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ToggleDisclosureGroupView<Content : View> : View {
    
    let item : SectionItem
    @ViewBuilder let content: Content
    //@State private var isExpanded : Bool = false

    var body: some View {
        DisclosureGroup(
//            isExpanded : $isExpanded,
            content: { content },
            label: {
                Label(
                    title: { Text(item.label) },
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
        )
        .disclosureGroupStyle(ToggleDisclosureGroupStyle())
    }
}


struct ToggleDisclosureGroupStyle: DisclosureGroupStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Toggle(isOn: configuration.$isExpanded) {
            configuration.label
        }
        .onChange(of: configuration.isExpanded) {
            withAnimation {
                configuration.isExpanded.toggle()
            }
        }
        if configuration.isExpanded {
            configuration.content
        }
    }
}

#Preview {
    ToggleDisclosureGroupView(
        item: SectionItem(label: "Date",image: "calendar",color: .brown)
    ){
        DatePicker("Date", selection: .constant(.now))
    }
    
}
