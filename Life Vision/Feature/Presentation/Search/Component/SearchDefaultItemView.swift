//
//  SearchDefaultItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 14.06.2024.
//

import SwiftUI

struct SearchDefaultItemView: View {
    
    let category : ReminderCategory
    
    var body: some View {
        Text("no item for \(category)")
            .font(.callout)
            .foregroundStyle(.gray)
    }
}

#Preview {
    SearchDefaultItemView(category: .tommorrow)
}
