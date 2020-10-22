//
//  Login.swift
//  tutorial
//
//  Created by Nathan Luu on 10/16/20.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var sessionSession = SessionStore()
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                FullwidthButton(label: "Log in", action: {
                    sessionSession.signIn(email: email, password: password)
                })
                
                FullwidthButton(label: "Sign up", action: {
                    sessionSession.signUp(email: email, password: password)
                })
            }
            .padding(.horizontal)
            .navigationBarTitle("Welcome")
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
