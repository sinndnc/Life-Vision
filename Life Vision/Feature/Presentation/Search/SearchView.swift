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
        GeometryReader(content: { geo in
            NavigationStack{
                List{
                    ForEach(viewModel.getCategories(),id:\.self){ category in
                        Section {
                            if(viewModel.hasItem(for: category)){
                                ForEach(viewModel.getItems(for: category),id:\.self){ item in
                                    SearchTaskItemView(geo:geo)
                                }
                            }else{
                                Text("no item for \(category) ")
                            }
                        } header: {
                            Text("\(category)".capitalized)
                        }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $viewModel.searchable)
                .localizedNavigationTitle(title: "Search")
            }
        })
    }
}



#Preview {
    SearchView(viewModel: SearchViewModel())
}
