//
//  mainScreen.swift
//  Escape
//
//  Created by Daniele Patrizio on 27/02/23.
//
// Menu View. From there you can start a new game, continue a game or understand how to play

import SwiftUI
import UIKit

struct CustomColor {
    static let myColor = Color("myblue")
    static let myColor2 = Color("myGray")
    static let myColor3 = Color("myRed")
    static let myColor4 = Color("myWhite")
    static let myColor5 = Color("myPurple")
    static let myColor6 = Color("myIce")
    
    // Add more here...
}


struct mainScreen: View {

    @Binding var isPlaying: Bool
    @Binding var shownHTP: Bool
    
    
    var body: some View {
        
            ZStack{
                GeometryReader{ geo in
                    Image("firstInt")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack (alignment: .center){
                        Text("Letters to Aris")
                                                    .font(.custom("Tabular Variable", size: 50))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.medium)
                                                    .padding(.top, 70)
                                                Spacer()

                        ZStack{
                            Button {
                              isPlaying = true
                                
                                    
                            } label: {
                                Label(" New Game ", systemImage: "play.fill")
                            }
                            .buttonStyle(threeD())
                            .frame(width: 357,height: 50)
                            .foregroundColor(.white)
                            .padding()
                            // cambiata la scritta "play" con "new game"
                            
                        }.font(.custom("Tabular Variable", size: 20))
                            .padding(5)
                        
                        Button{
                            shownHTP.toggle()
                            print(shownHTP)
                        }label: {
                            Text("How to Play")
                        }
                        .font(.custom("Tabular Variable", size: 20))
                        .buttonStyle(threeDBUTTON2())
                        .frame(width: 357,height: 50)
                        .foregroundColor(.black)
                        .padding()
                        
                    } .frame(maxWidth: 1300, maxHeight: 745, alignment: .bottom)
                    
                }
                .blur(radius: shownHTP ? 8 : 0, opaque: true)
               
                if shownHTP {
                    HowToPlayMenu(shownHTP: $shownHTP)
                }
            }
        
    }
    
    struct mainScreen_Previews: PreviewProvider {
        static var previews: some View {
            mainScreen( isPlaying: .constant(false), shownHTP: .constant(false)).previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
