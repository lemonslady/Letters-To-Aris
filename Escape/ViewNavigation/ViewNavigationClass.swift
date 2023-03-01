//
//  ViewNavigationClass.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 01/03/23.
//

import Foundation

class ViewNavigation {
    var viewShown : Int8
    
    init(viewShown: Int8) {
        self.viewShown = viewShown
    }
    
    func ViewMovement(viewshown : Int8) -> Void {
        switch viewshown {
        case 1:
            RoomView(room: Room(background: "room2", audio: [""], subtitles: ["Hello, im't trying to create a room"], objects: [Object(image: "letter")]))
        default:
            mainScreen()
        }
    }
}
