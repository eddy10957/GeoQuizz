//
//  GameView.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameManager : GameManagerVM
    
    var body: some View {
        if gameManager.reachedEnd{
            VStack(spacing: 80) {
                Text("🌎")
                    .font(.system(size: 120))
                
                VStack( spacing: 20){
                    
                    Text("GeoQuizz")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("AccentColor"))
                    Text("Congratulations you completed the game")
                    Text("You scored \(gameManager.score) out of \(gameManager.length)")
                }
                
                Button{
                    gameManager.startGame()
                }label:{
                    Label("Play Again", systemImage: "globe.europe.africa.fill")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .tint(Color("AccentColor"))
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.21568627450980393))
            .navigationBarHidden(true)
        }else {
        QuestionView()
            .environmentObject(gameManager)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameManagerVM())
    }
}
