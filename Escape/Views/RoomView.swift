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
            if(shownPM == false && shownHTP == false && shownQ == false){
                
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
        
        //Higher Order Function
        
        let command = arrayRooms.rooms[roomIndex].command?.first(where:{ transcript.contains($0.key)})
        //cerca all'interno di command il primo indice(e unico)(nel dizionario la key è il primo valore, il secondo il value) che rispetta una determinata condizione
        print(command)
        if (command != nil){
            roomIndex = arrayRooms.rooms.firstIndex(where: {
                command?.value == $0.id_room
            })!
        }
    }
    
    
    
    
    
    
    //func checkMiniGame(){}
    
    
    
    //Object Array of Rooms
    @StateObject var arrayRooms: ArrayRooms = ArrayRooms(rooms: [Room.Room1, Room.Room2, Room.Room3, Room.Room4_1, Room.Room4_1_1, Room.Room4_2, Room.Room4_3, Room.Room5, Room.Room6])
    @State var roomIndex: Int = 0
    
    //Pause Menu
    @State var shownPM = false
    @Binding var shownHTP: Bool
    @Binding var shownQ: Bool
    @Binding var isPlaying: Bool
    @Binding var isActive: Bool
    
    //Passing the transcript from SpeechRecognitionView to RoomView
    @State var transcript: String = ""
    
    //Timer
    @State var timerIndex: Int = 0
    
    @State private var fadeInOut = false
    
    @State var firstPress = true
    
    
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                Image(arrayRooms.rooms[roomIndex].background)
                    .resizable()
                    .ignoresSafeArea()
                
                ZStack{
                    Image("Dialog")
                        .resizable()
                        .frame(width: 665.0, height: 117.0)
                }.frame(width: 1200, height: 120, alignment: .center)
                
                VStack{
                    //Text(transcript)
                    if(arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag == true && firstPress == true){
                        HoldToPressLabel()
                    }
                    SpeechRecognitionView( transcript: $transcript, firstPress: $firstPress).disabled(!arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag).opacity(arrayRooms.rooms[roomIndex].speechRecognitionEnabledFlag ? 1 : 0.5)
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
                        .foregroundColor(CustomColor.myColor2)
                        .padding()
                }
                .frame(maxWidth: 120, maxHeight: 90)
                    Spacer()
                    //
                }
                
                .padding()
                
                
                
                HStack (alignment: .center){
                    Spacer()
                    Text(arrayRooms.rooms[roomIndex].subtitles[timerIndex])
                        .font(Font.custom("Tabular Variable", size: 17))
                        .foregroundColor(CustomColor.myColor2)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 611, maxHeight: 100, alignment: .center)
                        .padding(5)
                        .onAppear(){
                            //withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
                            //{
                            //    fadeInOut.toggle()
                            //}
                        }
                    //.opacity(fadeInOut ? 0: 1)
                    
                    
                    Spacer()
                }
                
                
            } //GeometryReader
            
            //For Pause Menu
            if shownPM
            { PauseMenu(shownPM: $shownPM, shownHTP: $shownHTP, shownQ: $shownQ) }
            
            if shownQ
            { QuitMenu(shownQ: $shownQ, shownHTP: $shownHTP, isPlaying: $isPlaying, isActive: $isActive) }
            
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
        .onChange(of: shownHTP){ _ in
            if (shownPM == false){
                self.checkContinue()
            }
            
        }
        
        .onChange(of: shownQ){ _ in
            if (shownPM == false){
                self.checkContinue()
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(shownHTP: .constant(false), shownQ: .constant(false), isPlaying: .constant(true), isActive: .constant(false)).previewInterfaceOrientation(.landscapeLeft)
    }
}
