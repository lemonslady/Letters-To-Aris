import SwiftUI

struct QuitMenu: View {
    @Binding var shownQ : Bool
    @Binding var shownHTP : Bool
    @Binding var isPlaying : Bool
    @Binding var isActive : Bool
    var body: some View {
        ZStack{
            Color("myPurple")
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(CustomColor.myColor4)
                .frame(width: 579, height: 406)
            
            VStack() {
                
                VStack{
                    Text("Are you sure you want to quit?").font(.custom("Tabular Variable", size: 22))
                    Spacer()
                    Text("This way you will end your game")
                        .font(Font.custom("Tabular Variable", size: 17))
                        .foregroundColor(Color(.gray))
                }
                .frame(width: 579, height: 70)
                
                Button{
                    shownQ.toggle()
                    
                }label: {
                    Text("Resume Game")
                }
                .font(Font.custom("Tabular Variable", size: 17))
                .buttonStyle(threeD())
                .frame(width: 357,height: 43)
                .foregroundColor(.white)
                .padding()
                
                Button{
                    shownQ.toggle()
                    isPlaying = false
                    
                }label: {
                    Text("Quit")
                }
                .font(.custom("Tabular Variable", size: 17))
                .buttonStyle(threeDBUTTON3())
                .frame(width: 357,height: 43)
                .foregroundColor(.white)
                .padding()
                
            }
            .fontWeight(.medium)
            .frame(width: 579, height: 450)
            
            if (!isActive && !shownQ){
                SplashView()
            }
        }
    }
}

struct QuitMenu_Previews: PreviewProvider {
    static var previews: some View {
        QuitMenu(shownQ: .constant(false), shownHTP: .constant(false), isPlaying: .constant(true), isActive: .constant(false))
    }
}
