//
//  WorkSpaceBodyView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 19.06.2024.
//

import SwiftUI

struct WorkSpaceBodyView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, content: {
                ForEach(viewModel.classifiedReminders[18] ?? [],id:\.self){ reminder in
                    WorkSpaceItemView(reminder: reminder)
                }
            })
        }
    }
}

#Preview {
    WorkSpaceBodyView(viewModel: HomeViewModel())
}