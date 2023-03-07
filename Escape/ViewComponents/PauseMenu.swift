//
//  PauseMenu.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 01/03/23.
//
// Pause Menu. It can be called in each room

import SwiftUI

struct PauseMenu: View {

    @Binding var shownPM : Bool
    @Binding var shownHTP : Bool
    @Binding var shownQ: Bool
    
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
                            shownPM.toggle()
                        }label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                          
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
                        shownPM.toggle()
                    }label: {
                        Text("Resume Game")
                    }
                    .font(Font.custom("Tabular Variable", size: 17))
                    .buttonStyle(threeD())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.white)
                    .padding()
                    
                    Button{
                        shownPM.toggle()
                        shownQ = true
                    }label: {
                        Text("Quit")
                    }
                    .font(.custom("Tabular Variable", size: 17))
                    .buttonStyle(threeDBUTTON3())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.white)
                    .padding()
                    
                    Button{
                        shownHTP.toggle()
                        shownPM.toggle()
                    }label: {
                        Text("How to Play")
                    }
                    .font(.custom("Tabular Variable", size: 17))
                    .buttonStyle(threeDBUTTON2())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.black)
                    .padding()
                    
                    
                }.fontWeight(.medium)
                .frame(width: 579, height: 450)
            }
        }
    }

struct PauseMenu_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenu(shownPM: .constant(false), shownHTP: .constant(false), shownQ: .constant(false))
    }
}
