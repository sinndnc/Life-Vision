//
//  CalendarView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 20.05.2024.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel : CalendarViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
            }
            .localizedNavigationTitle(title: "Calendar")
        }
    }
}

#Preview {
    CalendarView(viewModel: CalendarViewModel())
}
