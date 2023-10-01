//
//  ToDoListViewModel.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//
import FirebaseFirestore
import Foundation
class ToDoListViewModel : ObservableObject{
    @Published var showingItemView =  false
    private let userId : String
    init(userId: String){
        self.userId = userId
        
    }
    func deletItem(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
