//
//  mainScreen.swift
//  Escape
//
//  Created by Daniele Patrizio on 27/02/23.
//

import SwiftUI
import UIKit
struct CustomColor {
    static let myColor = Color("myblue")
    static let myColor2 = Color("myGray")

    
    // Add more here...
}


struct mainScreen: View {
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                Image("firstInt")
                    .resizable()
                    .ignoresSafeArea()
                
                ZStack(alignment: .top){
                    Button(action: {
                        print("button pressed")
                    }) {
                        Image(systemName: "gearshape.fill")                            .font(.system(size: 55))
                            .foregroundColor(Color(.white))
                        
                        
                    }
                }.frame(maxWidth: 1151, maxHeight: 150 ,alignment: .trailing)
                    .font(.system(size: 45))
                
                VStack{
                    ZStack{
                        
                        Button{
                            
                        }label: {
                            Label("Play", systemImage: "play.fill")
                        }
                        .buttonStyle(threeD())
                        .frame(width: 357,height: 43)
                        .foregroundColor(.white)
                        .padding()
                        
                        
                        
                        
                    }.font(.custom("Tabular-Variable.ttf", size: 20))
                    .padding(5)
                    
                    Button{
                        
                    }label: {
                       Text("How to Play")
                    }
                    .font(.custom("Tabular-Variable.ttf", size: 20))
                    .buttonStyle(threeDBUTTON2())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.black)
                    .padding()

                    
                    
                    
                    
                } .frame(maxWidth: 1300, maxHeight: 730, alignment: .bottom)
                
            }
        }
    }
    
    struct mainScreen_Previews: PreviewProvider {
        static var previews: some View {
            mainScreen().previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
