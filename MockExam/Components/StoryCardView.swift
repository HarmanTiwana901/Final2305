//
//  StoryCardView.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct StoryCardView: View {
    /// Store card view component
    @State var cardName: String = ""
    @State var image: String = ""
    var body: some View {
        ZStack {
            Image(image)
            Text(cardName)
                .font(.custom("Galada-Regular", size: UIScreen.main.bounds.width * 0.1))
                .foregroundColor(.white)
                .frame(alignment: .center)
        }
        .frame(width: 160, height: 200, alignment: .center)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius:14))
        .padding(5)
    }
}

struct newStoryCardView: View {
    var body: some View {
        StoryCardView(cardName: "Revenge", image: "2")
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        newStoryCardView()
    }
}
