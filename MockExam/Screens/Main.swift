//
//  Main.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct Main: View {
    /// Main screen
    @State var searchInput: String = ""
    var body: some View {
        TabView {
            ZStack {
                Image("mountains")
                VStack {
                    
                    HStack {
                        Text("Story")
                            .font(.custom("Galada-Regular", size: 60))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.02)
                        Image("candlestick")
                            .frame(alignment: .trailing)
                        Image("mask")
                    }
                    .frame(width: UIScreen.main.bounds.width * 1, alignment: .center)
                    
                    /// calling searchinput component
                    SearchInput(value: $searchInput)

                    /// story card view grid
                    VStack {
                        HStack(spacing: 2) {
                            StoryCardView(cardName: "Revenge", image: "1")
                            
                            StoryCardView(cardName: "Tragedy", image: "2")
                        }
                        HStack {
                            StoryCardView(cardName: "Hero", image: "3")
                            StoryCardView(cardName: "Quest", image: "4")
                        }
                    }
                }
            
                
            }
            .tabItem {
                ZStack {
                    Rectangle()
                        .fill(.red)
                    Image("Paper_Fill")
                }
                
            }
            Text("Hello")
            .tabItem {
                Image("Edit_fill")
            }
            Text("Bye")
            .tabItem {
                Image("User_alt_fill")
            }
        }
        /*
        ZStack {
            Image("mountains")
            HStack {
                Text("Story")
                    .font(.custom("Galada-Regular", size: 60))
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.12)
                Image("candlestick")
                    .frame(alignment: .trailing)
                VStack {
                    SearchInput(value: $searchInput)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 1, alignment: .center)
            
        }
         */
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
