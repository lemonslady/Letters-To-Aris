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
        VStack{
            Text(transcript)
            SpeechRecognitionView( transcript: $transcript)
            
            
        }.background(Image(room.background)
            .scaledToFit())
            
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(room: Room(background: "room1", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")])).previewInterfaceOrientation(.landscapeLeft)
    }
}
