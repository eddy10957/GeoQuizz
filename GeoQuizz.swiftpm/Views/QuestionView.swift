//
//  QuestionView.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var gameManager : GameManagerVM
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 80){
            HStack{
                Text("GeoQuizz")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
                
                ProgressBar(progress: gameManager.progress)
                    .padding()
                
                Text("\(gameManager.currentIndex) out of \(gameManager.length)")
                    .foregroundColor(Color("AccentColor"))
            }
            .padding()
            
            
            
            VStack(alignment: .center, spacing: 20){
                
                Text("\(gameManager.question)")
                    .foregroundColor(Color(red: 0.6, green: 0.8509803921568627, blue: 0.5490196078431373))
                    .font(.title)
                    .fontWeight(.bold)
                
                ForEach(gameManager.answers, id: \.id)
                { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(gameManager)
                }
                
                
                
                
            }
            
            Button{
                gameManager.goToNextQuestion()
            }label:{
                Text("Next")
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(gameManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            .disabled(!gameManager.answerSelected)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.043137254901960784, green: 0.1411764705882353, blue: 0.21568627450980393))
        .navigationBarHidden(true)
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(GameManagerVM())
    }
}
