//
//  mainFirst.swift
//  Escape
//
//  Created by Daniele Patrizio on 28/02/23.
//

import Foundation

final class mainFirst : Identifiable, ObservableObject{
    let id: UUID
    let mbackground: String
    let audio: [String]
    let subtitles: [String]
    let objects: [Object]

    init(id: UUID = UUID(), mbackground: String, audio: [String], subtitles: [String], objects: [Object]) {
        self.id = id
        self.mbackground = mbackground
        self.audio = audio
        self.subtitles = subtitles
        self.objects = objects
    }
}
