//
//  ProfileView.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.indigo)
                        .frame(width: 125, height: 125)
                    
                    VStack(alignment: .leading, spacing: 15){
                        HStack(spacing: 5){
                            Text("Name")
                                .font(.system(size: 28))
                                
                            Text(user.username)
                                .font(.system(size: 28))
                        }
                        HStack{
                            Text("Email")
                                .font(.system(size: 28))
                            Text(user.email)
                                .font(.system(size: 28))
                        }
                        HStack{
                            Text("Member Since :")
                                .font(.system(size: 28))
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button{
                        viewModel.logout()
                    }label: {
                        Text("Sign Out")
                            .frame(width: 180, height: 50)
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }/*else{
                    Text("Loading Profile...")
                    Button{
                        viewModel.logout()
                    }label: {
                        Text("Sign Up")
                            .frame(width: 180, height: 50)
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                */
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.getUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
