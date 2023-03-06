//
//  SplashView.swift
//  Escape
//
//  Created by Alfonso Buonaguro on 03/03/23.
//
// The first view that appears after opening the app

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = true
    
    //Array of Rooms
    
    //Variable that is used in case of playing
    @State var isPlaying: Bool = false
    @State var shownHTP = false
    
    var body: some View {
        ZStack {
            if !self.isActive {
                if(isPlaying == true){
                    RoomView(shownHTP: $shownHTP)
                }
                else{
                    mainScreen(isPlaying: $isPlaying, shownHTP: $shownHTP)
                }
                
                
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
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
