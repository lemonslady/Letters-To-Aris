//
//  EscapeApp.swift
//  Escape
//
//  Created by Giulia Casucci on 22/02/23.
//

import SwiftUI

@main
struct EscapeApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            
            //MOMENTANEO
            RoomView(room: Room(background: "room2", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")]))
        }
    }
}
