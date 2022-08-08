//
//  Loader.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        ZStack {
            /// Image background
            Image("sunset")
            VStack {
                /// Page headings
                Text("Share your bedtime stories")
                    .font(.custom("Galada-Regular.ttf", size: 26))
                    .foregroundColor(.white)
                Text("Beddy")
                    .foregroundColor(.white)
                    .font(.custom("Galada-Regular.ttf", size: 80))
                
            }
            
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
