//
//  CountdownHeader.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownHeaderView: View {
    
    var reminder : Reminder?
    
    var body: some View {
        HStack(content: {
            VStack(alignment: .leading){
                Text("Countdown to:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                if let reminder = reminder{
                    Text(reminder.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            Spacer()
        })
    }
}

#Preview {
    CountdownHeaderView()
}
