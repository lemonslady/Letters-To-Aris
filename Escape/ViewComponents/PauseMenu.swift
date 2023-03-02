//
//  PauseMenu.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 01/03/23.
//

import SwiftUI

struct PauseMenu: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(CustomColor.myColor4)
                .frame(width: 579, height: 507)
            
            VStack(alignment: .leading) {
                HStack{
                    Button{
                        
                    }label: {
                        Image("Xsymbol")
                    }
                    Spacer()
                }
                .frame(width: 470, height: 30)
                
                Spacer()
            }
            .frame(width: 470, height: 430)
            
            VStack {
                
                VStack{
                    Text("You are in pause").font(.custom("Tabular Variable", size: 22))
                    Spacer()
                    Text("Continue looking in the room")
                        .font(Font.custom("Tabular Variable", size: 17))
                        .foregroundColor(Color(.gray))
                }
                .frame(width: 579, height: 70)
                
                Button{
                    
                }label: {
                    Text("Resume Game")
                }
                .font(Font.custom("Tabular Variable", size: 17))
                .buttonStyle(threeD())
                .frame(width: 357,height: 43)
                .foregroundColor(.white)
                .padding()
                
                Button{
                    
                }label: {
                    Text("Quit")
                }
                .font(.custom("Tabular Variable", size: 17))
                .buttonStyle(threeDBUTTON3())
                .frame(width: 357,height: 43)
                .foregroundColor(.white)
                .padding()
                
                Button{
                    
                }label: {
                    Text("How to Play")
                }
                .font(.custom("Tabular Variable", size: 17))
                .buttonStyle(threeDBUTTON2())
                .frame(width: 357,height: 43)
                .foregroundColor(.black)
                .padding()
                
                
            }
            .frame(width: 579, height: 450)
        }
    }
}

struct PauseMenu_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenu()
    }
}
