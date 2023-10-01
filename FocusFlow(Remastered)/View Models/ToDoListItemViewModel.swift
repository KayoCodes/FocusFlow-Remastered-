//
//  ToDoListItemViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject{
    init(){
        
    }
    func toggleComplete(item: TaskItem){
        var newItemCpy = item
        newItemCpy.setDone(!item.completed)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItemCpy.id)
            .setData(newItemCpy.asDictionary())
    }
}
