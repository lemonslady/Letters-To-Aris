//
//  threeDBUTTON3.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 01/03/23.
//

import SwiftUI

struct threeDBUTTON3: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor7)
                .offset(x: 0, y: 11)
            
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor3)
                .border(CustomColor.myColor7, width: 2)
                .cornerRadius(4)
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)
            
            
        }
        .compositingGroup()
        
        
    }
}


struct threeDBUTTON3_Previews: PreviewProvider {
    static var previews: some View {
        Button("Play"){
            
        }
        .foregroundColor(.white)
        .frame(width: 357, height: 50)
        .buttonStyle(threeDBUTTON3())
    }
    
}
