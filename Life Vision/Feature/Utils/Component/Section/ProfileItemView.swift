//
//  ProfileItemView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 25.05.2024.
//

import SwiftUI

struct ProfileItemView: View {
    
    var user : User

    var body: some View {
        HStack(spacing: 15){
            if let image = user.image, let uiImage = UIImage(data: image){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .background(.gray)
                    .clipShape(Circle())
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

struct NoAccountProfileItemView : View {
    
    var body: some View{
        Text("Ups you don't have an account")
    }
}


#Preview {
    ProfileItemView(user: User(mail: "", name: "", surname: ""))
}
