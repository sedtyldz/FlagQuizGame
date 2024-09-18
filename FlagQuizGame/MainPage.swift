//
//  MainPage.swift
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

struct MainPage: View {
    var body: some View {
        // crate a navigation view for RulesPage
        NavigationView{
            ZStack{
                //show your background
                Image("BG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("FlagQuiz")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                        .padding()
                        .bold()
                        .padding()
                    Text("Test Your knowledge")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.yellow)
                    Spacer()
                    // add a buton to go another page
                    NavigationLink(destination: RulesPage(), label:{
                        Text("Rules  List      ")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .cornerRadius(10)
                            .frame(width:400,height:10)
                            .padding()
                    })
                    
                    
                    
                }
                
            }
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MainPage()
}

