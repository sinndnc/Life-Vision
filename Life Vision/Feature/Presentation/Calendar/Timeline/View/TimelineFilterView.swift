//
//  TimelineFilterView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 9.06.2024.
//

import SwiftUI

struct TimelineFilterView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : CalendarViewModel
    
    var body: some View {
        HStack{
            Text("December 2024")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            
            Button(
                action: {
                    
                },
                label: {
                Image(systemName: "camera.filters")
            })
            .buttonStyle(.plain)
            .padding(10)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "magnifyingglass")
            })
            .buttonStyle(.plain)
            .padding(10)

        }
        .padding()
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineFilterView(geo: geometry, viewModel: CalendarViewModel())
    })
}
