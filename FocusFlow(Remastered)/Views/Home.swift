//
//  Home.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/6/23.
//

import SwiftUI

struct Home: View {
    @State var index = 0
    var priColor : Color
    var body: some View {
        VStack(spacing: 25){
            Image(systemName: "brain.head.profile")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(priColor)
                .frame(width: 200, height: 180)
                .padding(.top,30)
            
                
               //.offset(y: -100)
            
            Text("FocusFlow")
                .font(.system(size: 45))
                .fontWeight(.bold)
                .foregroundColor(priColor)
                .multilineTextAlignment(.center)
            //Spacer()
                //.offset(y: -75)
            HStack{
                Button{
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        self.index = 0
                    }
                    
                   
                } label: {
                    Text("Existing")
                        .foregroundColor( self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical,10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                    
                }.background( self.index == 0 ?  Color.white : Color.clear)
                    .clipShape(Capsule())
                
                Button{
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        self.index = 1
                    }
                    
                } label: {
                    Text("New")
                        .foregroundColor( self.index == 1 ? priColor : .white)
                        .fontWeight(.bold)
                        .padding(.vertical,10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                    
                }.background(self.index == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                
            }.background(priColor.opacity(0.9))
                .clipShape(Capsule())
                //.offset(y:-50)
            if(self.index == 0 ){
                Existing(priColor:.indigo)
                    //.offset(y: -50)
            }else{
                New(priColor: .indigo)
                   // .offset(y: -50)
            }
            Spacer()
            
            
                
               
            
            
            
        }
        .padding()
     
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home( priColor: .indigo)
    }
}
