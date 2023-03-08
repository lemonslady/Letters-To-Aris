//
//  HowToPlayMenu.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 01/03/23.
//
// How to play. Appears or in the Main Screen or during the tutorial

import SwiftUI

struct HowToPlayMenu: View {
    @Binding var shownHTP : Bool
    var body: some View {
        ZStack{
            Color("myPurple")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(CustomColor.myColor4)
                .frame(width: 579, height: 507)
            
            VStack(alignment: .leading) {
                HStack{
                    Button{
                        shownHTP.toggle()
                    }label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    } //sostituita la x (image) con il SF SYMBOL
                    Spacer()
                }
                .frame(width: 470, height: 30)
                
                Spacer()
            }
            .frame(width: 470, height: 430)
            
            VStack(alignment: .center){
  
               
                VStack{
                    Text ("How to play")
                        .font(.custom("Tabular Variable", size: 28))
                        .foregroundColor(CustomColor.myColor7)
                        .padding()
                    
                    Text("Choose where to look first by pressing the microphone button ").font(.custom("Tabular Variable", size: 17))
                        .foregroundColor(.gray) +
                    Text(Image(systemName: "mic.square.fill"))
                        .foregroundColor(CustomColor.myColor)
                    + Text(" you will see on the bottom of the screen.")
                        .font(.custom("Tabular Variable", size: 17))
                    
                        .foregroundColor(.gray)
                }                    .multilineTextAlignment(.center)
                
                Text("This time you can either choose to look on the night stall, on the bed, or in the drawer.")
                    .font(.custom("Tabular Variable", size: 17))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text ("Just remember to have fun and enjoy the experience.")
                    .font(.custom("Tabular Variable", size: 17))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
            }
            .fontWeight(.medium)
            .frame(width: 400,height: 400)
        }
    }
}

struct HowToPlayMenu_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayMenu(shownHTP: .constant(false))
    }
}
