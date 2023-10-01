//
//  NewItemView.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/8/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel =  NewItemViewModel()
    @Binding var newItemPrsented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.top,60)
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Button{
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPrsented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                   
                }label: {
                    Text("Save Task")
                        .frame(width: (UIScreen.main.bounds.width - 100),height: 45)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .cornerRadius(10)
                        .padding()
                    
                        
                }
                
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text( "Please Fill In All Fields And/Or Include Propper Due Date"))
                }
                
            }
            
            
           
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPrsented: Binding(get: {
            return true
        }, set: {
            _ in
        }))
    }
}
