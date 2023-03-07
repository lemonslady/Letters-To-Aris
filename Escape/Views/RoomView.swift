//
//  RoomView.swift
//  Escape
//
//  Created by Giulia Casucci on 26/02/23.
//
// A general view of a room

import SwiftUI


struct RoomView: View {
    
    //Function to understand when ahd how go on
    enum ContinueCase {
        case timer
        case speech
        case miniGame
    }
    
    func checkContinue(){
        let continueCase: ContinueCase
        
        if(arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag == true){
            continueCase = .speech
        }
        else if(arrayRooms.rooms[roomIndex].minigameEnabledFlag == true){
            continueCase = .miniGame
        }
        else {
            continueCase = .timer
        }
        
        switch continueCase {
        case .timer:
            print("Case Timer")
            checkTimer()
            
        case .speech:
            print("Case Speech")
            checkSpeech()
            
        case .miniGame:
            print("Working on it")
            
        default:
            print("Error")
        }
    }
    
    func checkTimer(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            if(shownPM == false){
                
                if (timerIndex < arrayRooms.rooms[roomIndex].subtitles.count-1){
                    timerIndex += 1
                    checkTimer()
                    
                }
                else{
                    timerIndex = 0
                    if (roomIndex < arrayRooms.rooms.count-1){
                        roomIndex += 1
                    }
                }
                
            }
        }
    }
    
    func checkSpeech(){
        if (transcript.contains(arrayRooms.rooms[roomIndex].command!)){
            if (roomIndex < arrayRooms.rooms.count-1){
                roomIndex += 1
            }
        }
        
    }
    
    //func checkMiniGame(){}
    
    
    
    //Object Array of Rooms
    @StateObject var arrayRooms: ArrayRooms = ArrayRooms(rooms: [Room.Room1, Room.Room2, Room.Room3, Room.Room4])
    @State var roomIndex: Int = 0
    
    //Pause Menu
    @State var shownPM = false
    @Binding var shownHTP: Bool
    
    //Passing the transcript from SpeechRecognitionView to RoomView
    @State var transcript: String = ""
    
    //Timer
    @State var timerIndex: Int = 0
    
    
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                Image(arrayRooms.rooms[roomIndex].background)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    Text(transcript)
                    SpeechRecognitionView( transcript: $transcript).disabled(!arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag).opacity(arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag ? 1 : 0.5)
                    
                }.onChange(of: transcript){ _ in
                    checkSpeech()
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
                    Text(arrayRooms.rooms[roomIndex].subtitles[timerIndex])
                        .font(Font.custom("Tabular Variable", size: 17))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 611, maxHeight: 100, alignment: .center)
                        .padding(5)
                    
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
        .onAppear{
            self.checkContinue()
        }
        .onChange(of: roomIndex){ _ in
            self.checkContinue()
        }
        .onChange(of: shownPM){ _ in
            if (shownPM == false){
                self.checkContinue()
            }
        }
        
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(shownHTP: .constant(false)).previewInterfaceOrientation(.landscapeLeft)
    }
}
