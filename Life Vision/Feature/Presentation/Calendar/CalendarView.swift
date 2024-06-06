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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CalendarView(viewModel: CalendarViewModel())
}
