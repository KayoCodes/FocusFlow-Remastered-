//
//  loginViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/7/23.
//
import FirebaseAuth
import Foundation
class loginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){
        
    }
    func login()
    {
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate () -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Fill In All Fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please Enter Valid Email"
            return false
        }
        return true
    }
}
