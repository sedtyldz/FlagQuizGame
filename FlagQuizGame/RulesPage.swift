//
//  RulesPage.swift
//  FlagQuiz
//
//  Created by Sedat Yıldız on 12.08.2024.
//

/*
    Note:
 
    1 - All comment lines are written by Sedat Yıldız
 
    2 - The goal is to explain the code clearly to people
 
    3 - [Non-Stop Coding]
 */

import SwiftUI

struct RulesPage: View {
    
    // create an array to store rules senteces
    let rules: [String] = [
        
        "   1-Each correct answer is worth one point.",
        "   2-You have only 3 chances for wrong answers.",
        "   3-Flags are randomly selected.",
        "   4-You may see the same flag more than once.",
        "   5-The game continues until you lose.",
        
    ]
        
    
   
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Text(" Rules List")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.yellow)
                        .padding()
                    Spacer()
                }
                
                HStack{
                    VStack{
                        // to show the rules create a for loop
                        ForEach(rules, id: \.self){ rule in
                            
                            Text(rule)
                            
                                .frame(width:350,height: 50,alignment:.leading)
                            
                                .bold()
                                .foregroundColor(.white)
                                .font(.caption)
                                .background(Color.purple)
                                .clipShape(Capsule())
                                .cornerRadius(10)
                            
                            
                        }
                        .padding()
                    }
                    Spacer()
                }
                
                Spacer()
                // navigation link for another page
                NavigationLink {
                QuestionPage()
                } label: {
                    Text(" Questions     ")
                         .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .cornerRadius(10)
                        .frame(width:400,height:10)
                        .padding()
                        
                        
                }
                Spacer()

                
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
            }
            
        }


#Preview {
    RulesPage()
}

