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
    @StateObject var reminderViewModel : ReminderViewModel = ReminderViewModel()
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                List{
                    CountdownView(geo: geo,viewModel: viewModel)
                    WorkSpaceView(geo: geo,viewModel: viewModel)
                }
                .listStyle(.plain)
            }
            .localizedNavigationTitle(title: "Home")
            .taskView(reminderViewModel: $reminderViewModel)
            .homeToolBar(reminderViewModel: reminderViewModel)
        }
    }
}


fileprivate extension View{
    
    func taskView(reminderViewModel : ObservedObject<ReminderViewModel>.Wrapper) -> some View {
        return sheet(
            isPresented: reminderViewModel.isPresented,
            onDismiss: {},
            content: {
                ReminderView(
                    reminder: reminderViewModel.reminder,
                    leading: {
                        Button(action: {
                            reminderViewModel.isPresented.wrappedValue.toggle()
                        }, label: {
                            Text("Cancel")
                        })
                        
                    },
                    trailing: {
                        Button(action: {
                        }, label: {
                            Text("Done")
                        })
                    }
                )
            }
        )
    }
    
    func homeToolBar(reminderViewModel: ReminderViewModel) -> some View {
        toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button (
                    action: {
                        reminderViewModel.isPresented.toggle()
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
