//
//  Existing.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/6/23.
//

import SwiftUI

struct Existing: View {
    @StateObject var viewModel = loginViewModel()
    
    var priColor: Color
    var body: some View {
        VStack {
            VStack{
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Image(systemName: "envelope")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 24, height: 24)
                        .foregroundColor(priColor)
                        
                    TextField("Email", text: $viewModel.email)
                        .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                }
                Divider()
                    
                    
                HStack {
                    Image(systemName: "lock.shield")
                        .resizable()
                        .renderingMode(.original)
                        .foregroundColor(priColor)
                        .frame(width: 24, height: 24)
                    
                        
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        
                        .cornerRadius(10)
                        .background(Color.white)
                        .foregroundColor(.black)
                    .fontWeight(.medium)
                    .padding(.bottom,15)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                }
                    
                   
              
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(Color.white)
            .border(priColor)
            .cornerRadius(15)
            
            Button{
                viewModel.login()
            }label: {
                Text("LOGIN")
                    
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width - 100))
                    .background(priColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .fontWeight(.bold)
                    .offset(y: -20)
                    .shadow(radius: 15)
                    
            }
        }
        
    }
}

struct Existing_Previews: PreviewProvider {
    static var previews: some View {
        Existing(priColor: .indigo)
    }
}
