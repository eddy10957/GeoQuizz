//
//  AnswerRow.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import SwiftUI

struct AnswerRow: View {
    
    @EnvironmentObject var gameManager : GameManagerVM
    @State private var selected = false
    var answer : Answer
    
    var wrongAnswerColor = Color(hue: 1.0, saturation: 0.765, brightness: 0.967)
    var correctAnswerColor = Color(hue: 0.373, saturation: 0.767, brightness: 0.965)
    
    
    var body: some View {
        HStack(spacing:  20){
            
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .font(.title2)
                .fontWeight(.bold)
            
            if selected{
                
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill" )
                    .foregroundColor( answer.isCorrect ? correctAnswerColor : wrongAnswerColor)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .edgesIgnoringSafeArea(.all)
        .foregroundColor(gameManager.answerSelected ? (selected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: selected ? (answer.isCorrect ? correctAnswerColor : wrongAnswerColor): .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !gameManager.answerSelected {
                selected = true
                gameManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Italy", isCorrect: true))
            .environmentObject(GameManagerVM())
    }
}
