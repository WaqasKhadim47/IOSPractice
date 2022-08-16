//
//  ContentView.swift
//  Shared
//
//  Created by Waqas Khadim on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var username : String  = ""
    @State private var password : String  = ""
    @State private var wrongPassword : Int = 0
    @State private var wrongUsername : Int = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(Color.white.opacity(0.2))
                Circle().scale(1.3).foregroundColor(Color.white.opacity(0.9))
                VStack{
                    Text("Login")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login" ){
                        // authenticate user here
                        
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showLoginScreen){
                        EmptyView()
                    }
                }
            }
        }.navigationBarHidden(true)
    }
    func authenticateUser(username : String, password: String)  {

        if username.lowercased() == "demo@abc.com" {
            wrongUsername = 0
            if password.lowercased() == "abc@123"{
                wrongPassword = 0
                showLoginScreen = true
            } else{
                wrongPassword = 2
            }
        }
        else{
            wrongUsername = 2
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
