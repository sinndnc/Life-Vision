//
//  TimelineView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 30.05.2024.
//

import SwiftUI

struct TimelineGraphicView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : HomeViewModel

    var body: some View {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: .now)
        
        ScrollViewReader { proxy in
            ScrollView{
                TimelineLayout(reminders: viewModel.reminders){
                    TimelineHourView(geo: geo)
                    TimelineDividerView(geo: geo)
                    ForEach(viewModel.reminders,id: \.self) { reminder in
                        TimelineTaskView(geo: geo,reminder: reminder)
                    }
                    TimelineNowView(geo: geo)
                }
                .onAppear {
                    if (viewModel.graphicViewUIState == .initial){
                        proxy.scrollTo(hour,anchor: .center)
                        viewModel.graphicViewUIState = .success
                    }
                }
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineGraphicView(geo: geometry,viewModel: HomeViewModel())
    })
}

