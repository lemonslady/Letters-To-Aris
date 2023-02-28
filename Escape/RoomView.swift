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
    

    
 
    
    
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                Image(room.background)
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text(transcript)
                    SpeechRecognitionView( transcript: $transcript)
                    
                }.frame(maxWidth: 1200, maxHeight: 745, alignment: .bottom)

            }
                
            }
        
    }
        
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(room: Room(background: "room2", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")])).previewInterfaceOrientation(.landscapeLeft)
    }
}
