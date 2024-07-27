//
//  RootView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI


struct RootView: View {
    
    @StateObject var viewModel : RootViewModel
    @State private var selectedTab: TabEnum = .home

    var body: some View {
        TabView(selection: tabSelection()) {
            HomeView(viewModel: HomeViewModel())
                .tabview(tag: .home, text: "Home", image: "house")
            SearchView(viewModel: SearchViewModel())
                .tabview(tag: .search, text: "Search", image: "magnifyingglass")
//            MapView(viewModel: MapViewModel())
//                .tabview(tag: .map, text: "Map", image: "map.fill")
            CalendarView(viewModel: CalendarViewModel())
                .tabview(tag: .calendar, text: "Calendar", image: "calendar")
            AccountView(viewModel : AccountViewModel(user: viewModel.user))
                .tabview(tag: .account, text: "Account", image: "person.fill")
        }
    }
}

private extension View {
    func tabview(tag: TabEnum,text: String,image : String) -> some View {
        modifier(tabViewModifier(tag: tag, text: text,image: image))
    }
}

fileprivate extension RootView {
    private func tabSelection() -> Binding<TabEnum> {
        Binding { self.selectedTab }
        set: { tappedTab in
            if tappedTab == self.selectedTab {}
            self.selectedTab = tappedTab
        }
    }
}

struct tabViewModifier : ViewModifier {
    
    var tag : TabEnum
    var text : String
    var image : String
    
    func body(content: Content) -> some View {
        content
            .tag(tag)
            .tabItem {
                Label(LocalizedStringKey(text), systemImage: image)}
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
