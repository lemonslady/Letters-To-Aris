import SwiftUI

struct QuitMenu: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle()
                    .foregroundColor(CustomColor.myColor4)
                    .frame(width: 579, height: 406)
                
                VStack {
                    
                    VStack{
                        Text("Are you sure you want to quit?").font(.custom("Tabular Variable", size: 22))
                        Spacer()
                        Text("This way you will end your game")
                            .font(Font.custom("Tabular Variable", size: 17))
                            .foregroundColor(Color(.gray))
                    }
                    .frame(width: 579, height: 70)
                    
                    Button{
                        
                        
                    }label: {
                        Text("Resume Game")
                    }
                    .font(Font.custom("Tabular Variable", size: 17))
                    .buttonStyle(threeD())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.white)
                    .padding()
                    
                    NavigationLink{
                        mainScreen()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Quit")
                    }
                    .font(.custom("Tabular Variable", size: 17))
                    .buttonStyle(threeDBUTTON3())
                    .frame(width: 357,height: 43)
                    .foregroundColor(.white)
                    .padding()
                    
                }
                .frame(width: 579, height: 450)
            }
        }

    }
}

struct QuitMenu_Previews: PreviewProvider {
    static var previews: some View {
        QuitMenu()
    }
}
