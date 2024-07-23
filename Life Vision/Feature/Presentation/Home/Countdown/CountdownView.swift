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
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

    var body: some View {
        ZStack {
            AngularGradient(
                colors: [.red, .teal, .blue, .black, .indigo, .red],
                center: .center
            )
            .blur(radius: 20,opaque: true)

            VStack(spacing: 10){
                CountdownHeaderView(reminder: viewModel.upcoming)
                CountdownBodyView(geo: geo, viewModel: viewModel)
                CountdownBottomView()
            }
            .padding(10)
            .background(.clear)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        .onReceive(timer) { interval in
            if let upcoming = viewModel.upcoming{
                let timeInterval = upcoming.start_date.timeIntervalSinceNow
                if timeInterval > 0 {
                    viewModel.countDown = upcoming.start_date.timeIntervalSinceNow.toCountdown
                }
            }
        }
        
    }
        
}

#Preview {
    GeometryReader(content: { geometry in
        CountdownView(geo: geometry,viewModel: HomeViewModel())
    })
}
