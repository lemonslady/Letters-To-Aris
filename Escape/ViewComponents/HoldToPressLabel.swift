//
//  HoldToPressLabel.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 08/03/23.
//

import SwiftUI

struct HoldToPressLabel: View {
    var body: some View {
        ZStack{
            Image("Tag")
            Text (NSLocalizedString("Hold to speak", comment: ""))
                .padding(.bottom, 32.0)
                .font(.custom("Tabular Variable", size: 17))
                .fontWeight(.medium)
                .foregroundColor(CustomColor.myColor7)
        }
    }
}

struct HoldToPressLabel_Previews: PreviewProvider {
    static var previews: some View {
        HoldToPressLabel()
    }
}
