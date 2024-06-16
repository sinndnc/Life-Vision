//
//  CountdownBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownBodyView: View {
    
    var geo : GeometryProxy
    var countdown : Countdown
    
    var body: some View {
        
        let numbers = [
            countdown.day,
            countdown.hour,
            countdown.minute,
            countdown.seconds
        ]
        
        HStack(spacing: 10){
            ForEach(numbers,id: \.self){ number in
               CountdownItemView(geo: geo, number: number)
            }
        }
    }
}

#Preview {
    GeometryReader{ geo in
        CountdownBodyView(
            geo: geo,
            countdown: Countdown(day: 1, hour: 12, minute: 42, seconds: 33)
        )
    }
}
