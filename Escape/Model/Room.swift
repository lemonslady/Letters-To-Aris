//
//  Room.swift
//  Escape
//
//  Created by Giulia Casucci on 24/02/23.
//

import Foundation

//Things that I have to do:
//A room is built of a scene, a part of the story (audio), one or more objects to interact (type Object)
//It's possible to interact with objects, answer to the questions inside the view

final class Room : Identifiable, ObservableObject{
    let id: UUID
    let background: String
    let audio: [String]
    let subtitles: [String]
    let objects: [Object]

    init(id: UUID = UUID(), background: String, audio: [String], subtitles: [String], objects: [Object]) {
        self.id = id
        self.background = background
        self.audio = audio
        self.subtitles = subtitles
        self.objects = objects
    }
}

