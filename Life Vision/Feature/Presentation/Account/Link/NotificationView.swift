//
//  NotificationView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject var viewModel : AccountViewModel
    
    var body: some View {
        List {
            Section{
                Toggle("Notifications", isOn: .constant(true))
            }
        }
        .localizedNavigationTitle(title: "Notifications")
    }
}

#Preview {
    NotificationView(viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
