//
//  InputFieldView.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var value: String
    var placeholder: String
       /// input type ("text" - default, "password")
    var inputType: String
       /// error message
    var body: some View {
        
        HStack(alignment: .center) {
            
                Image("Moon_alt_fill")
                    .frame(width: 50, height: 70, alignment: .leading)
                    .padding(.horizontal)
                if inputType == "text" {
                    TextField(placeholder, text: $value)
                        .font(Font.body.italic())
                }
                
                if inputType == "password" {
                    SecureField(placeholder, text: $value)
                }
                
            }
        .frame(width: UIScreen.main.bounds.width * 0.80, height:60, alignment: .center)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius:14))
            .padding(5)
            
     
    }
}

struct newPreviewView: View {
    @State var inputValue: String = ""
    
    var body: some View {
        InputFieldView(
            value: $inputValue,
            placeholder: "email",
            inputType: "text"
        )
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        newPreviewView()
    }
}
