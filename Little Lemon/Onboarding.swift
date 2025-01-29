//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Jiří Uherek on 15.01.2025.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"


struct Onboarding: View {
    
    @State var firstName: String = "Jiří"
    @State var lastName: String = "Uherek"
    @State var email: String = "jirixuherek@gmail.com"
    @State var message: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView(){
            VStack(spacing : 20) {
                        Image("logo")
                            .frame(maxWidth: .infinity, alignment: .center)
                VStack{
                    HStack(alignment: .center, spacing: 40){
                        VStack(alignment: .leading){
                            Text("Little Lemon")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                            Text("Chicago")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .foregroundColor(.white)
                        }
                        Image("hero-image")
                            .resizable()
                            .scaledToFit()
                            .frame(width:150,height: 180)
                    }
                }
                .padding()
                .background(Color(red: 73 / 255, green: 94 / 255, blue: 87 / 255))
                NavigationLink(
                    destination: Home(),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(4)
                TextField("Last Name", text: $lastName)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(4)
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(4)
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        message = "Data saved successfully!"
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    }
                    else {
                        message = "Please fill out all fields."
                    }
                }) {
                    Text("Register")
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(4)
                }
            }
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
