//
//  TimelineHeaderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import SwiftUI

struct TimelineHeaderView: View {
    
    var geo : GeometryProxy
    @StateObject var viewModel : HomeViewModel

    let days = Calendar.current.getDaysOfMonth
    
    var body: some View {
        let width = geo.size.width * 0.14
        let height = geo.size.height * 0.1

        ScrollViewReader{ proxy in
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(1...days,id: \.self){ day in
                        let textColor : Color = viewModel.calenderService.getCurentDay.number != day ? .gray : .white
                        let background : Color? = viewModel.calenderService.getCurentDay.number != day ? nil : .blue
                        let name = Date().getThisMonthSpecificDay(day: day).getDayNameOfMonth
                        
                        VStack(spacing: 10){
                            Text(String(name))
                                .font(.callout)
                                .foregroundStyle(textColor)
                            Text(String(day))
                                .font(.callout)
                                .fontWeight(.bold)
                                .foregroundStyle(textColor)
                        }
                        .id(day)
                        .frame(width: width,height: height)
                        .background(background)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                Divider()
            }
            .onAppear{
                if (viewModel.headerViewUIState == .initial){
                    let day = viewModel.calenderService.getCurentDay.number
                    proxy.scrollTo(day ,anchor: .center)
                    viewModel.headerViewUIState = .success
                }
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineHeaderView(geo: geometry,viewModel: HomeViewModel())
    })
}
