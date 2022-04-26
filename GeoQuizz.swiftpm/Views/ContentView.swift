import SwiftUI

struct ContentView: View {
    
    @StateObject var gameManager : GameManagerVM = GameManagerVM()
    @State private var active = false
    var body: some View {
        
        NavigationView {
            VStack(spacing: 80) {
                
                Text("🌎")
                    .font(.system(size: 120))
                VStack(spacing: 20){
                    Text("GeoQuizz")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("AccentColor"))
                    
                    Text("Are you ready to test out your Geography skills?")
                        .foregroundColor(Color("AccentColor"))
                    
                }
                NavigationLink(destination: GameView()
                    .environmentObject(gameManager), isActive: $active){EmptyView()}
                    
                Button{
                    gameManager.startGame()
                    self.active.toggle()
                }label:{
                    Label("Play", systemImage: "globe.europe.africa.fill")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .tint(Color("AccentColor"))


            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.21568627450980393))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
