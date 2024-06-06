//
//  ProfileView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel : AccountViewModel
    @AppStorage(Preferences.image) var image = UserDefaults.standard.image

    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center){
                ZStack(alignment: .bottomTrailing){
                    if let uiImage = UIImage(data: image){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 125,height: 125)
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    Image(systemName: "pencil")
                        .padding(6)
                        .background(.gray)
                        .clipShape(Circle())
                }
                HStack{
                    Text(viewModel.user.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(viewModel.user.surname)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Text(viewModel.user.mail)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .frame(
                width: geo.size.width,
                height: geo.size.height * 0.150
            )
            
        }
    }
}

#Preview {
    ProfileView(viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
