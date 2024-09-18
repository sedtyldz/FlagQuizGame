//
//  QuestionPage.swift
//  FlagQuiz
//
//  Created by Sedat Yıldız on 13.08.2024.
//

/*
    Note:
 
    1 - All comment lines are written by Sedat Yıldız
 
    2 - The goal is to explain the code clearly to people
 
    3 - [Non-Stop Coding]
 */

import SwiftUI

struct QuestionPage: View {
    // variables
    @State private var options: [String] = []
    @State private var Gameover: Bool = false
    @State public var currentheart: Int = 3
    @State public var score: Int = 0
    
    @State public var answer: String = ""
    @State private var choice: Int = Int.random(in: 0...210)
    @State private var selectedOption: String = ""
    @State private var correctOption: String = ""
   
    var imagename2: String {
        "flag\(choice)"
    }
    
    let imagename = "heart"
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 20)
                HStack {
                    Text("Score = \(score)")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.green)
                    
                    Spacer()
                    
                    ForEach(0..<currentheart, id: \.self) { _ in
                        Image(imagename)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                
                
                Spacer().frame(height: 20)
                
                Text("What country does this flag belong to?")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                
                Spacer().frame(height: 0)
                
                Image(imagename2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 135)
                    .padding()
                
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                        check(selectedOption: selectedOption, choice: choice)
                    }) {
                        Text(option)
                            .font(.headline)
                            .frame(width: 300, height: 20)
                            .foregroundColor(.white)
                            .padding()
                            .background(selectedOption == option ? (option == correctOption ? Color.green : Color.red) : Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)
                }
                
                NavigationLink(destination: GameResult(Score: $score, reset: reset), isActive: $Gameover) {
                    EmptyView()
                }
            }
            .padding()
            .onAppear {
                loadCountries()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func reset() {
        score = 0
        currentheart = 3
        Gameover = false
        nextQuestion()
    }
    
    func check(selectedOption: String, choice: Int) {
        correctOption = answer
        if selectedOption == answer {
            score += 1
            print("Correct! Score: \(score)")
        } else {
            currentheart -= 1
            print("Incorrect! Hearts left: \(currentheart)")
        }

        if currentheart > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.nextQuestion()
            }
        } else {
            Gameover = true
        }
    }

    
    func nextQuestion() {
        choice = Int.random(in: 0...210)
        selectedOption = ""
        loadCountries()
    }
    
    func loadCountries() {
        if let filePath = Bundle.main.path(forResource: "countries", ofType: "txt") {
            do {
                let fileContents = try String(contentsOfFile: filePath)
                let countries = fileContents.components(separatedBy: .newlines)
                
                guard countries.count > choice else {
                    print("Seçilen ülke index'i, ülke listesi boyutundan büyük.")
                    return
                }
                
               
                options.removeAll()
                
                
                var uniqueOptions: Set<String> = [countries[choice]]
                
                while uniqueOptions.count < 4 {
                    let randomIndex = Int.random(in: 0..<countries.count)
                    if randomIndex != choice && randomIndex != 211 {
                        print("secim")
                        print(randomIndex)
                        uniqueOptions.insert(countries[randomIndex])
                    }
                }
                
               
                options = Array(uniqueOptions)
                
                
                options.shuffle()
                
                
                answer = countries[choice]
                
            } catch {
                print("Dosya okunamadı")
            }
        }
    }

}

#Preview {
    QuestionPage()
}

