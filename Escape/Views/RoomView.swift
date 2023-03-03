//
//  RoomView.swift
//  Escape
//
//  Created by Giulia Casucci on 26/02/23.
//

import SwiftUI

struct RoomView: View {
    //Pause Menu
    @State var shownPM = false
    @Binding var shownHTP : Bool
    
    @StateObject var room: Room
    //Passing the transcript from SpeechRecognitionView to RoomView
    @State var transcript: String = ""
    
    //Localization
    let stringTest = NSLocalizedString("Hello", comment: "The act of greeting someone")
    
    //Timer
    @State private var index: Int = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    
    
    var body: some View {
        NavigationStack {
            ZStack{
                GeometryReader{ geo in
                    Image(room.background)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack{
                        Text(transcript)
                        SpeechRecognitionView( transcript: $transcript)
                        
                    }
                    .frame(maxWidth: 1200, maxHeight: 720, alignment: .bottom)
                    
                    HStack{
                        Button{
                            print("button pressed")
                            shownPM.toggle()
                        }
                        
                    label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color(.white))
                            .padding()
                    }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: 1151, maxHeight: 100)
                    .padding()
                    
                    
                    
                    HStack (alignment: .center){
                        Spacer()
                        Text(room.subtitles[index])
                            .font(Font.custom("Tabular Variable", size: 17))
                             .foregroundColor(.white)
                             .multilineTextAlignment(.center)
                             .frame(maxWidth: 611, maxHeight: 100, alignment: .center)
                             .padding(5)
                             .onReceive(timer){ _ in
                                 if (index < room.subtitles.count-1){
                                     index = index + 1
                                     print(index)
                                 }
                             }
                        Spacer()
                        }
                         
                    
                } //GeometryReader
                .blur(radius: shownPM || shownHTP ? 8 : 0)
                
                //For Pause Menu
                if shownPM
                { PauseMenu(shownPM: $shownPM, shownHTP: $shownHTP) }
                
                if shownHTP
                { HowToPlayMenu(shownHTP: $shownHTP) }
                
            }//ZStack
        }//NavigationLike
        
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(shownHTP: .constant(false), room: Room(background: "room2", audio: [""], subtitles: [NSLocalizedString("Sub1", comment: ""), NSLocalizedString("Sub2", comment: ""), NSLocalizedString("Sub3", comment: "") ], objects: [])).previewInterfaceOrientation(.landscapeLeft)
    }
}
