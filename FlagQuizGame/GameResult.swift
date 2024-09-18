//
//  GameResult.swift
//  FlagQuiz
//
//  Created by Sedat Yıldız on 17.08.2024.
//

import SwiftUI

struct GameResult: View {
    @Binding var Score: Int
    var reset: () -> Void

    @AppStorage("highestScore") private var highestScore: Int = 0

    var body: some View {
        VStack {
            let image = "trophy"
            Spacer()
                .frame(height: 5)
            
            Text("Thank You For Playing")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.blue)
            
            Spacer()
                .frame(height: 100)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 150, alignment: .center)
            
            Spacer().frame(height: 90)
            
            Text("Your Score is \(Score)")
            
                .font(.title)
                .bold()
                .padding()
            
            if Score > highestScore {
                Text("New Highest Score!")
                    .bold()
                    .font(.headline)
                    .padding()
                    .foregroundColor(.green)
                let _ = highestScore = Score
            } else {
                Text("Highest Score: \(highestScore)")
                
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.green)
                    
            }
            
            Button(action: {
                reset()
            }) {
                Text("Play Again")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GameResult_Previews: PreviewProvider {
    static var previews: some View {
        GameResult(Score: .constant(0), reset: { })
    }
}

