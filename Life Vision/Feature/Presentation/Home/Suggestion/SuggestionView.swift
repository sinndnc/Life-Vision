//
//  SuggestionView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 15.06.2024.
//

import SwiftUI

struct SuggestionView: View {
    
    var geo : GeometryProxy
    var viewModel : HomeViewModel
    
    var body: some View {
        VStack(){
            HStack{
                Text("Suggestions")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack{
                ForEach(1...4,id: \.self){ number in
                   LocationSuggestion(geo: geo)
                }
            }
            .frame(width: geo.size.width)
            
        }
        .padding()
        .frame(
            width: geo.size.width,
            height: geo.size.height * 0.3
        )
    }
}

#Preview {
    GeometryReader { geo in
        SuggestionView(geo: geo, viewModel: HomeViewModel())
    }
}
