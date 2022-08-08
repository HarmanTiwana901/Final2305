//
//  SearchInput.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct SearchInput: View {
    /// search input component
    @Binding var value: String
    var body: some View {
        HStack {
            Image("glass")
                .padding(.horizontal)
            TextField("Search", text: $value)
                .font(Font.body.italic())
            Image("mic")
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 40, alignment: .center)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius:10))
    }
}

struct newSearchInputView: View {
    @State var inputValue: String = ""
    var body: some View {
        SearchInput(
            value: $inputValue
        )
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        newSearchInputView()
    }
}
