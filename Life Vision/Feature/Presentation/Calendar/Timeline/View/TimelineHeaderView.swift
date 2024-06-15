//
//  TimelineHeaderView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 1.06.2024.
//

import SwiftUI

struct TimelineHeaderView: View {
    
    var geo : GeometryProxy
    @State var selected : Int = 0
    @StateObject var viewModel : CalendarViewModel

    var body: some View {
        let width = geo.size.width * 0.14
        let height = geo.size.height * 0.1

        ScrollViewReader{ proxy in
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(1...Calendar.current.getDaysOfMonth,id: \.self){ day in
                        let currentDay = viewModel.calenderService.getCurentDay.number
                        let border : Color = day == currentDay ? .blue : .white
                        let name = Date().getThisMonthSpecificDay(day: day).getDayNameOfMonth
                        let textColor : Color = selected == day ? .white : day == currentDay ? .white : .gray
                        let background : Color? = selected == day ? .blue : day == currentDay ? .blue.opacity(0.2) : nil

                        Button {
                            selected = day
                        } label: {
                            VStack(spacing: 10){
                                Text(String(name))
                                    .font(.callout)
                                    .foregroundStyle(textColor)
                                Text(String(day))
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundStyle(textColor)
                            }
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
                    selected = viewModel.calenderService.getCurentDay.number
                    proxy.scrollTo(selected ,anchor: .center)
                    viewModel.headerViewUIState = .success
                }
            }
        }
    }
}

#Preview {
    GeometryReader(content: { geometry in
        TimelineHeaderView(geo: geometry,viewModel: CalendarViewModel())
    })
}
