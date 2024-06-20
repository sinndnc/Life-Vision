//
//  TagsView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct TagsView: View {
    
    @Binding var reminder : Reminder
    @State var tagTextfield : String = ""


    var body: some View {
        List {
            Section {
                HStack{
                    TagItemView()
                    Spacer()
                }
            }
            Section{
                TextField("Add new Tag", text: $tagTextfield)
            }
        }
        .localizedNavigationTitle(title: "Tags")
    }
}

#Preview {
    TagsView(reminder: .constant(Reminder()))
}
