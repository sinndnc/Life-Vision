//
//  SearchView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel : SearchViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
            }
            .localizedNavigationTitle(title: "Search")
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
