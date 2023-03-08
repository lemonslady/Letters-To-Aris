//
//  threeDBUTTON.swift
//  Escape
//
//  Created by Daniele Patrizio on 24/02/23.
//

import SwiftUI

struct threeD: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor7)
                .offset(x: 0, y: 11)
            
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor)
                .border(CustomColor.myColor7, width: 2)
                .cornerRadius(4)
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
        }
        .compositingGroup()
        
        
        
    }
}


struct threeDBUTTON_Previews: PreviewProvider {
    static var previews: some View {
        Button("NEW GAME"){
            
        }
        .foregroundColor(.white)
        .frame(width: 357, height: 55)
        .buttonStyle(threeD())
    }
}
