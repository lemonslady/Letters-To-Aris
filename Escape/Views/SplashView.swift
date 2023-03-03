//
//  SplashView.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 03/03/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = true
    var body: some View {
        ZStack {
            if !self.isActive {
                mainScreen()
            } else {
                Color("myPurple")
                    .ignoresSafeArea()
                VStack {
                    Text("Before we start, you can have a better experience using headphones and if you are in a quiet space")
                        .multilineTextAlignment(.center)
                }
                .frame(width: 611, height: 48, alignment: .center)
                .font(Font.custom("Tabular Variable", size: 17))
                .foregroundColor(.white)
            }
        }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        isActive.toggle()
                }
            }
        }
    }

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView().previewInterfaceOrientation(.landscapeLeft)
    }
}
