//
//  QuizModel.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import Foundation

struct Quiz {
    var currentQuestionIndex : Int
    var quizModel: QuizModel
    var quizCompleted : Bool = false
}

struct QuizModel{
    var question : String
    var answers : [Answer]
}



struct Answer : Identifiable {
    var id = UUID()
    var text : String
    var isCorrect : Bool
}
