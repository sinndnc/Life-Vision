//
//  CountdownBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 16.06.2024.
//

import SwiftUI


struct CountdownBodyView: View {
    
    var geo : GeometryProxy
    var viewModel : HomeViewModel


    var body: some View {
        HStack(spacing: 10){
            ForEach(CountdownEnum.allCases, id: \.self) { item in
                switch item {
                case .day:
                    CountdownItemView(geo: geo, value: viewModel.countDown?.day, maxItemValue: 30)
                case .hour:
                    CountdownItemView(geo: geo, value: viewModel.countDown?.hour, maxItemValue: 24)
                case .minute:
                    CountdownItemView(geo: geo, value: viewModel.countDown?.minute, maxItemValue: 60)
                case .second:
                    CountdownItemView(geo: geo, value: viewModel.countDown?.second, maxItemValue: 60)
                }
            }
        }
        
      
    }
    

    

    
}

#Preview {
    GeometryReader{ geo in
        CountdownBodyView(geo: geo,viewModel: HomeViewModel())
    }
}
