//
//  SpeechRecognitionView.swift
//  Escape
//
//  Created by Giulia Casucci on 22/02/23.
//
// The Speech Recognition view should appear only when it's possible to talk and give instructions

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
            
            Button {
                print("OK")
            } label: {
                Image(systemName: "mic.fill")
            }
                .font(.system(size: 35))
                .buttonStyle(threeDMIC())
                .frame(width: 89, height: 70)
                .foregroundColor(.white)
                .padding()
                .foregroundColor(.gray)
                .pressAction {
                    isPressed = true
                    print("pressed")
                    
                } onRelease: {
                    isPressed = false
                    print("released")
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
