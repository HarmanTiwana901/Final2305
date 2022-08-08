//
//  SignUp.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct SignUp: View {
    /// Sign up state variables and realm manager
    @EnvironmentObject var realmManager: RealmManager
    @State var email: String = ""
    @State var confirmEmail: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        ZStack {
            Image("sky")
            VStack {
                Text("Sign Up")
                    .font(.custom("Galada-Regular", size: 60))
                    .foregroundColor(.white)
                InputFieldView(value: $email, placeholder: "email", inputType: "text")
                    
                InputFieldView(value: $confirmEmail, placeholder: "confirm email", inputType: "text")
                InputFieldView(value: $password, placeholder: "password", inputType: "password")
                InputFieldView(value: $confirmPassword, placeholder: "password", inputType: "password")
                // Button view when clicked, will add user to the database
                ButtonView(buttonText: "Sign Up", email: email, cEmail: confirmEmail, password: password, cPassword: confirmPassword).environmentObject(RealmManager())
                    .padding()
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
