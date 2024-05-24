//
//  LifeVisionApp.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import Foundation
import SwiftUI

@main
struct LifeVisionApp : App {
    
    @State private var selectedTab: TabEnum = .home

    @StateObject var viewModel : RootViewModel
    @StateObject private var homeViewModel : HomeViewModel = HomeViewModel()
    @StateObject private var searchViewModel : SearchViewModel = SearchViewModel()
    @StateObject private var calendarViewModel : CalendarViewModel = CalendarViewModel()
    @StateObject private var accountViewModel : AccountViewModel = AccountViewModel()

    var body: some View {
        TabView(selection: tabSelection()) {
            HomeView(viewModel: homeViewModel)
                .tabView(tag: .home, text: "Home",image : "house")
            SearchView(viewModel: searchViewModel)
                .tabView(tag: .search, text: "Search",image : "magnifyingglass")
            CalendarView(viewModel: calendarViewModel)
                .tabView(tag: .calendar, text: "Calendar",image : "calendar")
            AccountView(viewModel : accountViewModel)
                .tabView(tag: .account, text: "Account",image : "person")
        }
    }
}

extension View {
    func tabView(tag: TabEnum,text: String,image : String) -> some View {
        modifier(tabViewModifier(tag: tag, text: text,image: image))
    }
}

extension RootView {
    
    func tabSelection() -> Binding<TabEnum> {
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
            .tabItem {Label(LocalizedStringKey(text), systemImage: image)}
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
