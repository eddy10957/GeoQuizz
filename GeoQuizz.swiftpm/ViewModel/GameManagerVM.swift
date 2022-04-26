//
//  GameManagerVM.swift
//  
//
//  Created by Edoardo Troianiello on 23/04/22.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {
    
    
    @Published var model = GameManagerVM.createGameModel(i: Int.random(in: 0...quizData.count - 1))
    @Published private(set) var question : String = ""
    @Published private(set) var answers : [Answer] = []
    
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var currentIndex = 0
    @Published private(set) var length = 5
    
    
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    
    var alreadyChoseIndexes : [Int] = []
    var selectedIndex : Int = 0
    
    func startGame() {
        self.score = 0
        self.currentIndex = 0
        self.progress = 0.0
        self.reachedEnd = false
        goToNextQuestion()
    }
    
    static func createGameModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }

    
    func goToNextQuestion(){
        if currentIndex < length {
            currentIndex += 1
            setQuestion()
        } else {
            reachedEnd = true
            alreadyChoseIndexes.removeAll()
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double((currentIndex)) / Double(length) * 350)
        selectedIndex = Int.random(in: 0...GameManagerVM.quizData.count - 1)
        while alreadyChoseIndexes.contains(selectedIndex){
                selectedIndex = Int.random(in: 0...GameManagerVM.quizData.count - 1)
        }
        alreadyChoseIndexes.append(selectedIndex)
        model = GameManagerVM.createGameModel(i: selectedIndex )
        question  = model.quizModel.question
        answers = model.quizModel.answers
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        
        if answer.isCorrect{
            score += 1
        }
    }
    
}


extension GameManagerVM {
    
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "What country is the second largest in the world by area?", answers: [
                Answer(text: "Russia 🇷🇺", isCorrect: false),
                Answer(text: "Canada 🇨🇦", isCorrect: true),
                Answer(text: "United States of America 🇺🇸", isCorrect: false),
                Answer(text: "China 🇨🇳", isCorrect: false)]),
            
            QuizModel(question: "Which European city has the highest mileage of canals in the world?", answers: [
                Answer(text: "Birmingham", isCorrect: true),
                Answer(text: "Venice", isCorrect: false),
                Answer(text: "Amsterdam", isCorrect: false),
                Answer(text: "Berlin", isCorrect: false)]),
            
            QuizModel(question: "Which city is the capital of the United States of America?", answers: [
                Answer(text: "Washington D.C", isCorrect: true),
                Answer(text: "New York", isCorrect: false),
                Answer(text: "Chicago", isCorrect: false),
                Answer(text: "Los Angeles", isCorrect: false)]),
            
            QuizModel(question: "How many regions does Italy have?", answers: [
                Answer(text: "19", isCorrect: false),
                Answer(text: "20", isCorrect: true),
                Answer(text: "21", isCorrect: false),
                Answer(text: "22", isCorrect: false)]),
            
            QuizModel(question: "What are the four corner states of the US?", answers: [
                Answer(text: "Oregon, Idaho, Nevada, Utah", isCorrect: false),
                Answer(text: "Kansas, Oklahoma, Arkansas, Louisiana", isCorrect: false),
                Answer(text: "Utah, Colorado, Arizona, New Mexico", isCorrect: true),
                Answer(text: "South Dakota, Minnesota, Nebraska, Iowa", isCorrect: false)]),
            
            QuizModel(question: "Which city is the capital of Italy🇮🇹 ?", answers: [
                Answer(text: "Milan", isCorrect: false),
                Answer(text: "Sorrento", isCorrect: false),
                Answer(text: "Florence", isCorrect: false),
                Answer(text: "Rome", isCorrect: true)]),
            
            QuizModel(question: "Which US state has the highest population?", answers: [
                Answer(text: "California", isCorrect: true),
                Answer(text: "Texas", isCorrect: false),
                Answer(text: "Florida", isCorrect: false),
                Answer(text: "New York", isCorrect: false)]),
            
            QuizModel(question: "What country has a horizontal bicolor red and white flag?", answers: [
                Answer(text: "Malta", isCorrect: false),
                Answer(text: "Monaco", isCorrect: true),
                Answer(text: "Bahrain", isCorrect: false),
                Answer(text: "Liechtenstein", isCorrect: false)]),
            
            QuizModel(question: "How many states are in Australia🇦🇺 ?", answers: [
                Answer(text: "4", isCorrect: false),
                Answer(text: "5", isCorrect: false),
                Answer(text: "6", isCorrect: true),
                Answer(text: "7", isCorrect: false)]),
            
            QuizModel(question: "Which city is the capital of France🇫🇷 ?", answers: [
                Answer(text: "Paris", isCorrect: true),
                Answer(text: "Lyon", isCorrect: false),
                Answer(text: "Toulouse", isCorrect: false),
                Answer(text: "Marseille", isCorrect: false)]),
            
            QuizModel(question: "Which city is the capital of Germany🇩🇪 ?", answers: [
                Answer(text: "Munich", isCorrect: false),
                Answer(text: "Berlin", isCorrect: false),
                Answer(text: "Frankfurt", isCorrect: false),
                Answer(text: "Dortmund", isCorrect: true)]),
            
            QuizModel(question: "Which city is the capital of United Kingdom🇬🇧 ?", answers: [
                Answer(text: "Manchester", isCorrect: false),
                Answer(text: "Liverpool", isCorrect: false),
                Answer(text: "Cambridge", isCorrect: false),
                Answer(text: "London", isCorrect: true)]),
            
            QuizModel(question: "Which city is the capital of Norway🇳🇴 ?", answers: [
                Answer(text: "Stockholm", isCorrect: false),
                Answer(text: "Helsinki", isCorrect: false),
                Answer(text: "Oslo", isCorrect: true),
                Answer(text: "Copenhagen", isCorrect: false)]),
        ]
    }
    
}


