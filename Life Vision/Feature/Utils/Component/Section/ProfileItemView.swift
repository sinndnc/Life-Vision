//
//  ProfileItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import SwiftUI

struct ProfileItemView: View {
    
    var user : User?
    var value : AccountDestination

    @AppStorage(Preferences.image) private var image = UserDefaults.standard.image

    var body: some View {
        NavigationLink(value: value){
            if let user = user{
                HStack(spacing: 15){
                    if let uiImage = UIImage(data: image){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60,height: 60)
                            .background(.gray)
                            .clipShape(Circle())
                    }else{
                        Image("DefaultImage")
                            .resizable()
                            .scaledToFit()
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 60,height: 60)
                    }
                    VStack(alignment: .leading){
                        HStack(spacing: 5){
                            Text(user.name)
                                .font(.title3)
                                .fontWeight(.medium)
                            Text(user.surname)
                                .font(.title3)
                                .fontWeight(.medium)
                        }
                        Text("E-mail, Password, Purchase etc.")
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

struct NoAccountProfileItemView : View {
    
    var body: some View{
        Text("Ups you don't have an account")
    }
}


#Preview {
    ProfileItemView(user: User(mail: "", name: "", surname: ""),value: .profile)
}
