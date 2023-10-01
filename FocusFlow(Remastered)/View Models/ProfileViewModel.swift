//
//  ProfileViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ProfileViewModel : ObservableObject{
    @Published var user: User? = nil
    init(){
        
    }
    func logout(){
        do{
            try Auth.auth().signOut()
        }catch{
           print(error)
        }
    }
    
    func getUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{ [weak self]
            snapshot , error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  username: data["username"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
}
