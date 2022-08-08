//
//  Login.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var realmManager: RealmManager
    @State var email: String = ""
    @State var password: String = ""
    @State var isTicked = false
    @State var redirect = false
    var body: some View {
        ZStack {
            Image("sky")
            /// Page headings
            VStack {
                Text("Login")
                    .font(.custom("Galada-Regular", size: 60))
                    .foregroundColor(.white)
                InputFieldView(value: $email, placeholder: "email", inputType: "text")
                    .padding()
                InputFieldView(value: $password, placeholder: "password", inputType: "password")
                HStack(spacing: 45 ) {
                    Button {
                        isTicked.toggle()
                    } label: {
                        if isTicked == true {
                            Image(systemName: "checkmark.square")
                                .foregroundColor(.white)
                        }
                        if isTicked == false {
                            Image(systemName: "square")
                                .foregroundColor(.white)
                        }
                        Text("Remember me")
                            .italic()
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    
                    Text("Forgot password?")
                        .italic()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        
                }
                .frame(width: UIScreen.main.bounds.width * 0.80)
                .padding()
                
                ButtonView(buttonText: "Login", email: email, cEmail: email, password: password, cPassword: password).environmentObject(RealmManager())
                
                ZStack {
                    
                    Button {
                        redirect = true
                    } label: {
                        
                        Text("Don't have an account? Create one")
                            .italic()
                            .font(.system(size: UIScreen.main.bounds.width * 0.04))
                            .foregroundColor(.white)
                            
                    }
                    .sheet(isPresented: $redirect) {
                        SignUp()
                    }
                }.frame(alignment: .bottomLeading)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
