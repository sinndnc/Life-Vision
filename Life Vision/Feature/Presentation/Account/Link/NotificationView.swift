//
//  NotificationView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var isDisabled = true
    @StateObject var viewModel : AccountViewModel
    @AppStorage(Preferences.notification) private var notification : Bool = UserDefaults.standard.notification
    @AppStorage(Preferences.notifications) private var storedDictionaryData: Data = UserDefaults.standard.notifications
    
    var body: some View {
        List {
            Section{
                Toggle("Notifications", isOn: $notification)
            }footer: {
                Text("You can close all notifications channel with this button")
            }
            ForEach(storedDictionaryData.decodeToDictionary().compactMap{$0.key}.sorted(),id:\.self){ category in
                Section{
                    let categories = storedDictionaryData.decodeToDictionary()[category] ?? [:]
                    ForEach(Array(categories).sorted{$0.key > $1.key},id: \.key){ subCategory,value in
                        Toggle("\(subCategory) Notifications",isOn: self.binding(key: category,subkey: subCategory))
                            .disabled(!notification)
                    }
                }header: {
                    Text(category)
                }
            }
        }
        .localizedNavigationTitle(title: "Notifications")
      
    }
    
    private func binding(key : String, subkey: String) -> Binding<Bool> {
        Binding<Bool>(
            get: { return storedDictionaryData.decodeToDictionary()[key]?[subkey] ?? false },
            set: { newValue in
                var decoded = storedDictionaryData.decodeToDictionary()
                decoded[outerKey]?[subkey] = newValue
                storedDictionaryData = decoded.encode()
            }
        )
    }
}

#Preview {
    NotificationView(viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
