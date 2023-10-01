//
//  NewItemViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var  showAlert = false
    
    
    
    init(){
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        let newId = UUID().uuidString
        let newItem = TaskItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, completed: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400)else{
            return false
        }
        return true
    }
}
