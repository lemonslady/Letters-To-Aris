//
//  RoomView.swift
//  Escape
//
//  Created by Giulia Casucci on 26/02/23.
//

import SwiftUI

struct RoomView: View {
    @State var shownPM = false
    @Binding var shownHTP : Bool
    @StateObject var room: Room
    @State var transcript: String = ""
    @State var object = Object(image: "letter")
    @State var subtitle = "The letter smells of ambrosia and orange flowers, fragrant and \n airy. He picks it up, opens it and a mix of emotions almost \n makes his heart stop."
    
    
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                GeometryReader{ geo in
                    Image(room.background)
                        .resizable()
                        .ignoresSafeArea()
                    VStack{
                        Text(transcript)
                        SpeechRecognitionView( transcript: $transcript)
                        
                        
                    }
                    .frame(maxWidth: 1200, maxHeight: 745, alignment: .bottom)
                    
                    HStack{
                        Button{
                            print("button pressed")
                            shownPM.toggle()
                        }
                        
                    label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(.white))
                            .padding()
                    }
                        
                        Spacer()
                        
                        Button{
                            print("button pressed")
                        }
                        
                    label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(.white))
                            .padding()
                    }
                        
                    }
                    .frame(maxWidth: 1151, maxHeight: 100)
                    .padding()
                    
                    VStack{
                        Image(object.image)
                            .frame(width: 900, height: 1000)
                    }
                    VStack{
                        Text(subtitle)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 1200, maxHeight: 104, alignment: .center)
                            .font(.custom("Tabular Variable", size: 20))
                            .padding(5)
                        
                    } //Commento provvisorio statico utilizzato per il tiktok video
                    
                }
                .blur(radius: shownPM || shownHTP ? 8 : 0)
                
                if shownPM {
                    PauseMenu(shownPM: $shownPM, shownHTP: $shownHTP)
                }
                
                if shownHTP {
                    HowToPlayMenu(shownHTP: $shownHTP)
                }
            }
        }
        
    }
    
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(shownHTP: .constant(false), room: Room(background: "room2", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")])).previewInterfaceOrientation(.landscapeLeft)
    }
}
