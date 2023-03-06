//
//  Object.swift
//  Escape
//
//  Created by Giulia Casucci on 24/02/23.
//
// An object inside a room.

import Foundation

final class Object: Identifiable{
    let id: UUID
    let image: String

    init(id: UUID = UUID(), image: String) {
        self.id = id
        self.image = image
    }
}
