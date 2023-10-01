//
//  ToDoListView.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/7/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items: [TaskItem]
    
    init(userId: String) {
        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in
                    ToDoListItemView(item: item)
                        
                        .swipeActions{
                            Button{
                                viewModel.deletItem(id: item.id)
                            }label: {
                                Text("Remove")
                                    .tint(.red)
                            }
                        }
                    
                }.padding(5)
                    
                    
                
            }
            
            .foregroundColor(Color.indigo)
            .navigationTitle("To Do's")
            
            .toolbar{
                Button{
                    //action
                    viewModel.showingItemView = true
                }label: {
                    Image(systemName: "plus")
                        .tint(Color.indigo)
                }
            }
            .sheet(isPresented: $viewModel.showingItemView){
                NewItemView( newItemPrsented: $viewModel.showingItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "Cqx216jveNSrMZVod4tIPVk1JBx1")
    }
}
