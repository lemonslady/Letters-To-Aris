//
//  RoomView.swift
//  Escape
//
//  Created by Giulia Casucci on 26/02/23.
//

import SwiftUI

struct RoomView: View {
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
                    
            }
        }
        
    }
        
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(room: Room(background: "room2", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")])).previewInterfaceOrientation(.landscapeLeft)
    }
}
