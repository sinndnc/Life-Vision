//
//  CountdownBottomView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownBottomView: View {
    var body: some View {
        HStack(content: {
            Spacer()
            Text("after")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        })
    }
}

#Preview {
    CountdownBottomView()
}
