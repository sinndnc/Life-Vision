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
        GeometryReader{ geo in
            NavigationStack{
                List{
                    ForEach(Array(viewModel.filteredTasksByCategories),id:\.key){ (category , reminders) in
                        Section {
                            ForEach(reminders,id:\.self){ reminder in
                                SearchTaskItemView(geo:geo,reminder: reminder)
                            }
                        } header: {
                            Text("\(category)".capitalized)
                        }
                    }
                    
                    
                }
                .listStyle(.plain)
                .localizedNavigationTitle(title: "Search")
                .searchable(text: $viewModel.searchable, placement: .navigationBarDrawer(displayMode: .always))
            }
        }
    }
}




#Preview {
    SearchView(viewModel: SearchViewModel())
}
