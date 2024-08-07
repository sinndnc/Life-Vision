//
//  CalendarView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 20.05.2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var searchQuery: String = ""
    @StateObject var viewModel : CalendarViewModel

    var body: some View {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: .now)
        
        NavigationStack{
            GeometryReader{geo in
                VStack{
                    TimelineHeaderView(geo: geo, viewModel:viewModel)
                    ScrollViewReader { proxy in
                        ScrollView{
                            TimelineGraphicView(geo: geo, viewModel:viewModel)
                        }
                        .onAppear {
                            if (viewModel.graphicViewUIState == .initial) {
                                proxy.scrollTo(hour,anchor: .center)
                                viewModel.graphicViewUIState = .success
                            }
                        }
                    }
                }
            }
            .searchable(text: .constant(""))
            .navigationBarTitleDisplayMode(.inline)
            .localizedNavigationTitle(title: "December 2024")
        }
        .onAppear{
            viewModel.fetchReminders()
        }
    }
}

#Preview {
    CalendarView(viewModel: CalendarViewModel())
}
