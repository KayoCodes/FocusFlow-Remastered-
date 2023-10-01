//
//  registerViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/7/23.
//
import FirebaseAuth
import Foundation

import FirebaseFirestore

class registerViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var passwordCopy = ""
    @Published var username = ""
    @Published var errorMessage = ""

    
    init(){
        
    }
    
    func register(){
        print("Register Called")
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else{
               // print(result)
                return
        }
            self.insertUser(id: userId)
            print("Creating user")
        }
    }
    
    private func insertUser(id: String){
        let newUser = User(id: id,
                           username: username,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordCopy.trimmingCharacters(in: .whitespaces).isEmpty else{
           errorMessage = "Please Fill in All Fields"
            print("fail vali")
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please Enter Valid Email"
            print("fail vali")
            return false
        }
        
       // guard passwordCopy == password else {
          //  errorMessage = "Passwords do not match"
           // return false
       // }
        print("True")
        return true
    }
}
