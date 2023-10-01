//
//  contentViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/7/23.
//
import FirebaseAuth
import Foundation

class contentViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignerIn : Bool{
        return Auth.auth().currentUser != nil
    }
    
    
}
