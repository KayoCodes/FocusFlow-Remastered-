//
//  ToDoListItemView.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: TaskItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                    .bold()
                    .lineLimit(1)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
            }
            Spacer()
            
            Button{
                viewModel.toggleComplete(item: item)
            }label: {
                Image(systemName: item.completed ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 28, height: 28)
                    
                    
            }
            
        }
        
        //.background(.indigo)
        //.cornerRadius(8)
        .padding(6)
            
    }
    
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "1234",
                                     title: "Expiremental", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, completed: true))
    }
}
