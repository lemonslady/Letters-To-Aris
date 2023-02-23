//
//  SpeechRecognitionView.swift
//  Escape
//
//  Created by Giulia Casucci on 22/02/23.
//

import SwiftUI

struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}



struct SpeechRecognitionView: View {
    
    @State private var isPressed = false
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    var body: some View {
        
        
        VStack{
            Text(speechRecognizer.transcript).padding()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "mic")
            })
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(!isPressed ?
                        Color(UIColor.gray) :
                            Color(UIColor.black))
            .cornerRadius(25)
            .pressAction {
                isPressed = true
                
            } onRelease: {
                isPressed = false
                
            }
            
            
            ///
            .onChange(of: isPressed, perform: {_ in
                if isPressed == true{
                    speechRecognizer.reset()
                    speechRecognizer.transcribe()
                }
                else {
                    speechRecognizer.stopTranscribing()
                }
            })
            
        }
    }
}


extension View {
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressActions(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}


struct SpeechRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechRecognitionView().previewInterfaceOrientation(.landscapeLeft)
    }
}
