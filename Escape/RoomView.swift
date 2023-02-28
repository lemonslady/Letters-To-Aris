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
    let stringTest = NSLocalizedString("Hello", comment: "The act of greeting someone")
    
    var body: some View {
        VStack{
            Text(transcript)
            SpeechRecognitionView( transcript: $transcript)
            
            Text(stringTest).foregroundColor(.white)
            
        }.background(Image(room.background))
        //how to blur the image:
        //.blur(radius: 8, opaque: false)
            
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(room: Room(background: "room1", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")])).previewInterfaceOrientation(.landscapeLeft)
    }
}
