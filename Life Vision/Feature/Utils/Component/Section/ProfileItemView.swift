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
                HStack(spacing: 10){
                    if let uiImage = UIImage(data: image){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60,height: 60)
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading,spacing: 5){
                        HStack(spacing: 10){
                            Text(user.name)
                                .font(.title3)
                            Text(user.surname)
                                .font(.title3)
                        }
                        Text("E-mail, Password, Purchase etc.")
                            .font(.footnote)
                    }
                }
            }else {
                NoAccountProfileItemView()
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
