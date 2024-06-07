//
//  TitleItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct TitleItemView: View {
    
    @Binding var text : String
    var placeholder : String = ""
    
    var body: some View {
        TextField(placeholder, text: $text ,axis: .vertical)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    TitleItemView(text: .constant(""))
}
