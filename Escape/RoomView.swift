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
                            .frame(width: 900, height: 600)
                    }

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
