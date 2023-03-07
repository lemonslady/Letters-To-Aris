//
//  Room.swift
//  Escape
//
//  Created by Giulia Casucci on 24/02/23.
//
// Room class.

import Foundation

final class Room : Identifiable, ObservableObject{
    let id: UUID
    let background: String
    //let audio: [String]
    let subtitles: [String]
    //let objects: [Object]
    //flags
    //SpeechRecognition
    let speechRecognitionEnabledFlag: Bool
    //Minigames
    let minigameEnabledFlag: Bool
    let command: String?
    

    init(id: UUID = UUID(), background: String, subtitles: [String], speechRecognitionEnabledFlag: Bool, minigameEnabledFlag: Bool, command: String?) {
        self.id = id
        self.background = background
        //self.audio = audio
        self.subtitles = subtitles
        //self.objects = objects
        self.speechRecognitionEnabledFlag = speechRecognitionEnabledFlag
        self.minigameEnabledFlag  = minigameEnabledFlag
        self.command = command
    }
    
    static let Room1_1 = Room(background: "purple", subtitles: [NSLocalizedString("Sub1", comment: ""), NSLocalizedString("Sub2", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    static let Room2 = Room(background: "firstInt", subtitles: [NSLocalizedString("Sub1", comment: ""), NSLocalizedString("Sub2", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    static let Room3 = Room(background: "room2", subtitles: [NSLocalizedString("Sub3", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command: NSLocalizedString("Command1", comment: ""))
    static let Room4 = Room(background: "purple", subtitles: [NSLocalizedString("Sub4", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    static let Room5 = Room(background: "purple", subtitles: [NSLocalizedString("Sub4", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
}


final class ArrayRooms: Identifiable, ObservableObject{
    let id: UUID
    let rooms: [Room]
    
    init(id: UUID = UUID(), rooms: [Room]) {
        self.id = id
        self.rooms = rooms
    }
}
