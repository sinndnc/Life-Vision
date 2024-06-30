//
//  SearchView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchQuery: String = ""
    @StateObject var viewModel : SearchViewModel

    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                List{
                    ForEach(
                        Array(viewModel.searchFilter(searchQuery,viewModel.reminders)),id:\.key){ (category , reminders) in
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
                .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack{
                            Menu {
                                Button("menu item 2", action: {})
                            } label: {
                                Image(systemName: "tag")
                            }
                            Menu {
                                Button("menu item 1", action: {})
                                Button("menu item 2", action: {})
                            } label: {
                                Image(systemName: "line.horizontal.3.decrease.circle")
                            }
                        }
                    }
                }
            }
        }
    }
}




#Preview {
    SearchView(viewModel: SearchViewModel())
}
