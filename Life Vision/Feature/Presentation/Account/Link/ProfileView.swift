//
//  ProfileView.swift
//  Life Vision
//
//  Created by Sinan Dinç on 24.05.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var showDialog : Bool = false
    @State private var showPicker : Bool = false
    @State private var showCamera : Bool = false
    
    @StateObject var viewModel : AccountViewModel
    @AppStorage(Preferences.image) var image = UserDefaults.standard.image

    var body: some View {
        List {
            Section{
                VStack(alignment: .center){
                    ZStack(alignment: .bottomTrailing){
                        if let uiImage = UIImage(data: image){
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 100,height: 100)
                        }else{
                            Image("DefaultImage")
                                .resizable()
                                .scaledToFit()
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 100,height: 100)
                        }
                    
                        Image(systemName: "photo")
                            .padding(5)
                            .tint(.black)
                            .background(Color.white.blur(radius: 5))
                            .clipShape(Circle())
                            .onTapGesture {
                                showDialog.toggle()
                            }
                        
                    }
                    .frame(width: 500)
                    HStack{
                        Text(viewModel.user.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(viewModel.user.surname)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    Text(viewModel.user.mail)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
            .listRowBackground(Color.clear)
            Section {
                TextField(viewModel.user.name, text: .constant(""))
                TextField(viewModel.user.surname, text: .constant(""))
                TextField(viewModel.user.mail, text: .constant(""))
                TextField("+90 536 636 0880", text: .constant(""))
            }header: {
                Text("Personal information")
            }footer: {
                Text("When you want to change one of this Textfields you can just edit which do you want and click the trailing button")
            }
            Section{
                TextField("Old Password", text: .constant(""))
                TextField("New Password", text: .constant(""))
                TextField("Confirm Password", text: .constant(""))
            }header: {
                Text("Password")
            }footer: {
                Text("If you forget your password you can also try get password with your phone number")
            }
        }
        .confirmationDialog(
            "Select a photo which do you want to option",
            isPresented: $showDialog,
            titleVisibility: .visible
        ) {
            Button("Select Photos") {
                showPicker.toggle()
            }
            Button("Take a picture") {
                //TODO: take a picture
                showCamera.toggle()
            }
        }
        .photosPicker(isPresented: $showPicker, selection: .constant([]))
    }
}

#Preview {
    ProfileView(viewModel: AccountViewModel(user: User(mail: "", name: "", surname: "")))
}
