//
//  CountdownView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import SwiftUI

struct CountdownView: View {
    
    var geo : GeometryProxy
    var viewModel : HomeViewModel
    
    var body: some View {
        
        let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

        VStack{
            CountdownHeaderView(title: "viewModel.countdown.")
            CountdownBodyView(geo: geo, countdown: viewModel.countdown)
            CountdownBottomView()
        }
        .padding()
        .frame(
            width: geo.size.width,
            height: geo.size.height * 0.3
        )
        .onReceive(timer) { interval in
            let timeInterval = viewModel.reminders.last!.start_date.timeIntervalSince(interval)
            if timeInterval > 0 {
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownView(geo: geometry,viewModel: HomeViewModel())
    })
}
