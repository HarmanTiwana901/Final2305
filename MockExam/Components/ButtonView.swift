//
//  Button.swift
//  MockExam
//
//  Created by Jessie sihota on 2022-08-08.
//

import SwiftUI

struct ButtonView: View {
    /// Button view variables
    @State var showAlert = false
    @State var showAlert2 = false
    @State var redirect = false
    var buttonText: String
    var email: String
    var cEmail: String
    var password: String
    var cPassword: String
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            Button {
                if buttonText == "Sign Up" {
                    if email != cEmail || password != cPassword {
                        showAlert = true
                    }
                    realmManager.addUser(email: email, password: password)
                }
                
                if buttonText == "Login" {
                    /// if this function returns 1 send user to main page otherwise keep them here
                    if realmManager.getUser(email: email, password: password) == 1 {
                        print("Logged in!")
                        redirect = true
                        /// redirect to main
                        Main()
                    } else {
                        showAlert2 = true
                    }
                }
            } label: {
                Text(buttonText)
                    .font(.custom("Galada-Regular", size: 23))
                    .foregroundColor(Color(red: 25 / 255, green: 96 / 255, blue: 126/255))
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Attention"), message: Text("Email or passwords dont match"), dismissButton: .default(Text("OK")))
            }
            .alert(isPresented: $showAlert2) {
                Alert(title: Text("Attention"), message: Text("Incorrect email or password"), dismissButton: .default(Text("OK")))
                
            }
            .sheet(isPresented: $redirect) {
                Main()
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.49, height: UIScreen.main.bounds.height * 0.07)
        .background(Color(red: 184 / 255, green: 218 / 255, blue: 238 / 255))
        .clipShape(RoundedRectangle(cornerRadius:14))
    }
}

struct newButtonView: View {
    var body: some View {
        ButtonView(
            buttonText: "Login",
            email: "ht901na@gmail.com",
            cEmail: "ht901na@gmail.com",
            password: "Hello",
            cPassword: "Hello"
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        newButtonView()
    }
}
