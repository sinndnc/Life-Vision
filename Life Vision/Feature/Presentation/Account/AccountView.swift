//
//  AccountView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel : AccountViewModel
    @State private var path : [AccountDestination] = []

    var body: some View {
        NavigationStack(path: $path){
            List {
                Section{
                    if let user = viewModel.user{
                        NavigationLink {
                            ProfileView(user: user, viewModel: viewModel)
                        }
                        label: { ProfileItemView(user : user) }
                    }
                    else{ noUser }
                }
                Section{
                    SegmentedItemView(
                        menu: Theme.themes,
                        item: AccountSectionConstant.theme,
                        selected: $viewModel.theme
                    )
                    NavigationLinkItemView(
                        item: AccountSectionConstant.language,
                        value: AccountDestination.language,
                        selected: viewModel.language.toString
                    )
                    NavigationLinkItemView(
                        item: AccountSectionConstant.notification,
                        value: AccountDestination.notification
                    )
                }header: {
                    Text("Preferences")
                }
                Section{
                    NavigationLinkItemView(
                        item: AccountSectionConstant.privacyAndPolicy,
                        value: AccountDestination.privacyAndPolicy
                    )
                    NavigationLinkItemView(
                        item: AccountSectionConstant.termsAndConditions,
                        value: AccountDestination.termsAndConditions
                    )
                    NavigationLinkItemView(
                        item: AccountSectionConstant.aboutUs,
                        value: AccountDestination.aboutUs
                    )
                }header: {
                    Text("Security")
                }
            }
            .localizedNavigationTitle(title: "Account")
            .navigationGraph(path: $path, viewModel: viewModel)
        }
    }
    
    
    @ViewBuilder
    var noUser : some View {
        ZStack {
            NavigationLink(destination: ZStack{}) {
                Text("No found user please sign in")
            }
        }
    }
    
}

fileprivate extension View{

    func navigationGraph(path : Binding<[AccountDestination]>,viewModel: AccountViewModel) -> some View {
        return navigationDestination(for: AccountDestination.self) { destination in
            switch destination {
            case .language:
                LanguageView(path: path,viewModel: viewModel)
            case .notification:
                NotificationView(viewModel: viewModel)
            case .privacyAndPolicy:
                PrivacyAndPolicyView()
            case .termsAndConditions:
                TermsAndConditionsView()
            case .aboutUs:
                AboutUsView()
            }
        }
    }
}

#Preview {
    AccountView(viewModel: AccountViewModel(user:nil))
}
