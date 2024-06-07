//
//  LanguageView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct LanguageView: View {
        
    @Binding var path : [AccountDestination]
    @StateObject var viewModel : AccountViewModel

    var body: some View {
        List{
            ForEach(Language.languages, id: \.self){ language in
                Button(action: {
                    viewModel.language = language
                    path.removeAll()
                }, label: {
                    Text(language.toString)
                    Spacer()
                    viewModel.language == language ? Image(systemName: "checkmark") : nil
                })
                .buttonStyle(.plain)
            }
        }
    }
    
}

#Preview {
    LanguageView(path: .constant([]),viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
