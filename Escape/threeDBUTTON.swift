//
//  threeDBUTTON.swift
//  Escape
//
//  Created by Daniele Patrizio on 24/02/23.
//

import SwiftUI
import UIKit

    struct threeD: ButtonStyle {

        func makeBody(configuration: Configuration) -> some View {
            ZStack{
                
                let offset: CGFloat = 5
                
                
                RoundedRectangle(cornerRadius: 4)
                
                    .foregroundColor(.black)
                    .offset(x: 0, y: 15)
              
                
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(CustomColor.myColor)
                    .border(Color.black, width: 2)
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
        Button("Play"){
            
        }
        .foregroundColor(.white)
        .frame(width: 357, height: 43)
        .buttonStyle(threeD())
    }
}
