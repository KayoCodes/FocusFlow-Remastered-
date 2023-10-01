//
//  ContentView.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = contentViewModel()
    var body: some View {
        
        if viewModel.isSignerIn, !viewModel.currentUserId.isEmpty{
           accountView
            
        }else{
            ZStack {
                LinearGradient(gradient: Gradient(colors:[.black,.black,.black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
               
                Home( priColor: .indigo)
                    
                    
            }
            
        }
      
        
        
        
        
    }
    @ViewBuilder
   var accountView : some View{
       
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
