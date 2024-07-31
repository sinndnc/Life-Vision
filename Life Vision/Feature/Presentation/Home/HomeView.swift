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
    @State var uIState : UIState = .initial
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ScrollView{
                    if uIState == .success {
                        CountdownView(geo: geo,viewModel: viewModel)
                            .transition(.scale)
                        WorkSpaceView(geo: geo,viewModel: viewModel)
                            .transition(.scale)
                    }
                }
                .onAppear{
                    if(uIState == .initial){
                        withAnimation {
                            uIState = .success
                        }
                    }
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
                            ZStack{
                                AngularGradient(
                                    colors: [.red, .teal, .blue, .black, .indigo, .red],
                                    center: .center)
                                Image(systemName: "calendar.badge.plus")
                                    .padding(5)
                                    .foregroundStyle(.white)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    )
                
               
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
