//
//  CountdownHeader.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI

struct CountdownHeaderView: View {
    
    var title : String
    
    var body: some View {
        HStack(content: {
            VStack(alignment: .leading){
                Text("Countdown to:")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            Spacer()
        })
    }
}

#Preview {
    CountdownHeaderView(title: "Plant the there")
}
