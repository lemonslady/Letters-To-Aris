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
    @Binding var transcript: String
    
    var body: some View {
        
        VStack{
            
            //Text(speechRecognizer.transcript)
            Button(action: {
                
            }, label: {
                Image(systemName: "mic.circle.fill").font(.system(size: 90))
            })
            .foregroundColor(.gray)
            .pressAction {
                isPressed = true
                
            } onRelease: {
                isPressed = false
                
            }
            .onChange(of: isPressed, perform: {_ in
                if isPressed == true{
                    speechRecognizer.reset()
                    speechRecognizer.transcribe()
                }
                else {
                    speechRecognizer.stopTranscribing()
                    transcript = speechRecognizer.transcript
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
        SpeechRecognitionView(transcript: .constant("")).previewInterfaceOrientation(.landscapeLeft)
    }
}
