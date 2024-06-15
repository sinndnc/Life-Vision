//
//  TimelineView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 30.05.2024.
//

import SwiftUI

struct TimelineGraphicView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : CalendarViewModel

    var body: some View {
    
        TimelineLayout(reminders: viewModel.reminders) {
            TimelineHourView(geo: geo)
            TimelineDividerView(geo: geo)
            TimelineNowView(geo: geo)
            ForEach(viewModel.reminders,id: \.self){ reminder in
                TimelineTaskView(geo: geo,reminder: reminder)
                    .contextMenu {
                        Button("show all tasks") {
                            
                        }
                    }preview: {
                        VStack {
                            TimelineTaskView(geo: geo, reminder: reminder)
                        }
                    }
            }
        }
        .padding(5)
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineGraphicView(geo: geometry,viewModel: CalendarViewModel())
    })
}

