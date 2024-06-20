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
    
    @StateObject var viewModel : HomeViewModel
    @StateObject var taskViewModel : ReminderViewModel = ReminderViewModel(reminder: Reminder())
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                List{
                    CountdownView(geo: geo,viewModel: viewModel)
                    WorkSpaceView(viewModel: viewModel)
                }
                .listStyle(.plain)
            }
            .localizedNavigationTitle(title: "Home")
            .homeToolBar(taskViewModel: taskViewModel)
            .taskView(isPresented: $taskViewModel.isPresented,taskViewModel: taskViewModel)
        }
        .task { viewModel.fetchReminders() }
    }
}


fileprivate extension View{
    
    func taskView(isPresented : Binding<Bool>,taskViewModel : ReminderViewModel) -> some View {
        return sheet(
            isPresented: isPresented,
            onDismiss: {},
            content: {
                ReminderView(viewModel: taskViewModel)
            }
        )
    }
    
    func homeToolBar(taskViewModel: ReminderViewModel) -> some View {
        toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button (
                    action: {
                        taskViewModel.isPresented.toggle()
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
