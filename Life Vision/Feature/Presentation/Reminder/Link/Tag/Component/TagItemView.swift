//
//  TagItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct TagItemView: View {
    var body: some View {
        Text("#Dental")
            .padding(10)
            .font(.callout)
            .background(.blue)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TagItemView()
}
