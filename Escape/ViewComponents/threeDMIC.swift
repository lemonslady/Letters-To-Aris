//
//  threeDMIC.swift
//  Escape
//
//  Created by Daniele Patrizio on 03/03/23.
//

import SwiftUI

struct threeDMIC: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(CustomColor.myColor7)
                .offset(x: 0, y: 13)
          
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(configuration.isPressed ? CustomColor.myColor6 : CustomColor.myColor)
                .border(CustomColor.myColor7, width: 2)
                .cornerRadius(4)
                .offset(y: configuration.isPressed ? 8 : 0)
                

            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)
                .foregroundColor(configuration.isPressed ? CustomColor.myColor7 : .white)
            
        }
        .compositingGroup()
        

    }
}


struct threeDMIC_Previews: PreviewProvider {
   static var previews: some View {
        Button {
            print("Edit button was tapped")
        } label: {
            Image(systemName: "mic.fill")
                .font(.system(size: 35))
        }
        .frame(width: 90, height: 90)
        .buttonStyle(threeDMIC())
    }

}
