//
//  threeDBUTTON2.swift
//  Escape
//
//  Created by Daniele Patrizio on 28/02/23.
//

import SwiftUI

struct threeDBUTTON2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.black)
                .offset(x: 0, y: 11)
            
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor2)
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
        }
        .compositingGroup()
        
        
    }
}


struct threeDBUTTON2_Previews: PreviewProvider {
    static var previews: some View {
        Button("Play"){
            
        }
        .foregroundColor(.white)
        .frame(width: 357, height: 55)
        .buttonStyle(threeDBUTTON2())
    }
    
}
