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
    static let myColor3 = Color("myRed")
    static let myColor4 = Color("myWhite")
    
    // Add more here...
}


struct mainScreen: View {
    
    @State var shownHTP = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                GeometryReader{ geo in
                    Image("firstInt")
                        .resizable()
                        .ignoresSafeArea()
                    
                    ZStack(alignment: .top){
                        Button{
                            print("button pressed")
                        }
                        
                    label: {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color(.white))
                            
                            
                        }
                    }.frame(maxWidth: 1151, maxHeight: 150 ,alignment: .trailing)
                    
                    VStack{
                        ZStack{
                            NavigationLink {
                                RoomView(shownHTP: $shownHTP, room: Room(background: "room2", audio: [""], subtitles: [NSLocalizedString("Sub1", comment: ""), NSLocalizedString("Sub2", comment: ""), NSLocalizedString("Sub3", comment: "") ], objects: []))
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Label("Play", systemImage: "play.fill")
                            }
                            .buttonStyle(threeD())
                            .frame(width: 357,height: 43)
                            .foregroundColor(.white)
                            .padding()
                            
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
                        .frame(width: 357,height: 43)
                        .foregroundColor(.black)
                        .padding()
                        
                    } .frame(maxWidth: 1300, maxHeight: 730, alignment: .bottom)
                    
                }
                .blur(radius: shownHTP ? 8 : 0)
                
                if shownHTP {
                    HowToPlayMenu(shownHTP: $shownHTP)
                }
            }
        }
    }
    
    struct mainScreen_Previews: PreviewProvider {
        static var previews: some View {
            mainScreen().previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
