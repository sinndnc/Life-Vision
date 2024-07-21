//
//  HomeView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import Combine
import FirebaseFirestore

struct HomeView: View {
    
    @State var isPresented : Bool = false
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ScrollView{
                    Divider()
                    CountdownView(geo: geo,viewModel: viewModel)
                    Divider()
                    WorkSpaceView(geo: geo,viewModel: viewModel)
                }
            }
            .homeToolBar(isPresented: $isPresented)
            .localizedNavigationTitle(title: "Home")
            .taskView(isPresented: $isPresented, onDissmis:{})
        }
    }
}


fileprivate extension View{
    
    func taskView(isPresented : Binding<Bool>,  onDissmis : @escaping () -> Void ) -> some View {
        return sheet(
            isPresented: isPresented,
            onDismiss: { onDissmis() },
            content: { ReminderAddView(viewModel: ReminderViewModel()) }
        )
    }
    
    func homeToolBar(isPresented : Binding<Bool>) -> some View {
        toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button (
                    action: {
                        isPresented.wrappedValue.toggle()
                    },label: {
                        Image(systemName: "calendar.badge.plus")
                    }
                )
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
