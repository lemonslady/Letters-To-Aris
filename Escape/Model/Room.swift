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
    let id_room: String
    let background: String
    let subtitles: [String]
    //let audio: [String]
    //let objects: [Object]
    
    //Flags
    //SpeechRecognition
    let speechRecognitionEnabledFlag: Bool
    //Minigames
    let minigameEnabledFlag: Bool
    let command: [String:String]?
    
    

    init(id: UUID = UUID(), id_room: String, background: String, subtitles: [String], speechRecognitionEnabledFlag: Bool, minigameEnabledFlag: Bool, command: [String:String]?) {
        self.id = id
        self.id_room = id_room
        self.background = background
        self.subtitles = subtitles
        self.speechRecognitionEnabledFlag = speechRecognitionEnabledFlag
        self.minigameEnabledFlag  = minigameEnabledFlag
        self.command = command
    }
    
    //Purple Room
    static let Room1 = Room(id_room: "Room1", background: "purple", subtitles: [NSLocalizedString("Sub1.1", comment: ""), NSLocalizedString("Sub1.2", comment: ""), NSLocalizedString("Sub1.3", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
    //Blurred Room
    static let Room2 = Room(id_room: "Room2", background: "Bed_Scene_Blurred", subtitles: [NSLocalizedString("Sub2.1", comment: ""), NSLocalizedString("Sub2.2", comment: ""), NSLocalizedString("Sub2.3", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
    //Clear Bed
    static let Room3 = Room(id_room: "Room3", background: "Bed_Scene", subtitles: [NSLocalizedString("Sub3.1", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[NSLocalizedString("Command1.1", comment: ""): "Room4_1", NSLocalizedString("Command1.2", comment: ""): "Room4_2", NSLocalizedString("Command1.3", comment: ""): "Room4_3"])
    
    //Giusta, comodino
    static let Room4_1 = Room(id_room: "Room4_1", background: "Nightstall_With_Letter", subtitles: [NSLocalizedString("Sub4.1", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[ NSLocalizedString("Command2.1", comment: "") : "Room5", NSLocalizedString("Command2.2", comment: "") : "Room5"])
    
    //Letto - Bed
    static let Room4_2 = Room(id_room: "Room4_2", background: "firstInt", subtitles: [NSLocalizedString("Sub4.2", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[NSLocalizedString("Command1.1", comment: ""): "Room4_1", NSLocalizedString("Command1.3", comment: ""): "Room4_3"])
    
    //Comodino -
    static let Room4_3 = Room(id_room: "Room4_3", background: "Closed_Drawer", subtitles: [NSLocalizedString("Sub4.3", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[NSLocalizedString("Command1.1", comment: ""): "Room4_1", NSLocalizedString("Command1.2", comment: ""): "Room4_2"])
    
    static let Room5 = Room(id_room: "Room5", background: "Closed_Letter", subtitles: [NSLocalizedString("Sub5.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
    static let Room6 = Room(id_room: "Room6",background: "Opened_Letter", subtitles: [NSLocalizedString("Sub6.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
   
   static let Room7 = Room(id_room: "Room7", background: "Opened_Letter", subtitles: [NSLocalizedString("Sub7.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
  //  static let Room8 = Room(background: "Closed_Suitcase", subtitles: [NSLocalizedString("8.1", comment: ""), NSLocalizedString("8.2", comment: ""), NSLocalizedString("8.3", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
  //  static let Room9 = Room(background: "4_Item_Full_3", subtitles: [NSLocalizedString("8.4", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
  //  static let Room10 = Room(background: "4_Item_Full_3", subtitles: [NSLocalizedString("8.5", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[ NSLocalizedString("Command3.1", comment: ""), NSLocalizedString("Command3.2", comment: "")])
    
  //  static let Room11_1 = Room(background: "Console", subtitles: [NSLocalizedString("9.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
   // static let Room11_2 = Room(background: "Closed_Drawer", subtitles: [NSLocalizedString("9.2", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
  //  static let Room12 = Room(background: "Console", subtitles: [NSLocalizedString("10.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
   // static let Room13 = Room(background: "Console", subtitles: [NSLocalizedString("10.2", comment: "")], speechRecognitionEnabledFlag: true, minigameEnabledFlag: false, command:[ NSLocalizedString("Command3.1", comment: ""), NSLocalizedString("Command3.2", comment: "")])
    
    //static let Room14 = Room(background: "Opened_Full_Wardrobe_No_Polaroid", subtitles: [NSLocalizedString("11.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
    //static let Room15 = Room(background: "Picked_Polarpoid", subtitles: [NSLocalizedString("12.1", comment: "")], speechRecognitionEnabledFlag: false, minigameEnabledFlag: false, command: nil)
    
}


final class ArrayRooms: Identifiable, ObservableObject{
    let id: UUID
    let rooms: [Room]
    
    init(id: UUID = UUID(), rooms: [Room]) {
        self.id = id
        self.rooms = rooms
    }
}
