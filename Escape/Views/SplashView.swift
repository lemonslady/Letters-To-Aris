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
    @State var shownQ = false
    var body: some View {
        ZStack {
            if !self.isActive {
                if(isPlaying == true){
                    RoomView(shownHTP: $shownHTP, shownQ: $shownQ, isPlaying: $isPlaying, isActive: $isActive)

      
                }
                else{
                    mainScreen(isPlaying: $isPlaying, shownHTP: $shownHTP)
                }
                
                
            } else {
                Color("myPurple")
                    .ignoresSafeArea()
                ZStack{
                    Image("Dialog")
                        .resizable()
                            .frame(width: 665.0, height: 117.0)
                }
                VStack {
                    
                    Text(NSLocalizedString("Introduction", comment: "")).multilineTextAlignment(.center)
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
