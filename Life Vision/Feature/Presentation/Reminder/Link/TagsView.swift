//
//  TagsView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct TagsView: View {
    
    @Binding var path : [ReminderDestination]
    @StateObject var viewModel : ReminderViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TagsView(path: .constant([]), viewModel: ReminderViewModel())
}
