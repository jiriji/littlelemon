//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Jiří Uherek on 16.01.2025.
//

import SwiftUI

struct UserProfile: View {
    
    var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    var email: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing:20){
            Image("logo")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            Text("Personal Information")
                .font(.title)
            Image("profile-image-placeholder")
                .scaledToFit()
                .padding()
            Text("First name: \(firstName)")
                .font(.headline)
            Text("Last name: \(lastName)")
                .font(.headline)
            Text("Email: \(email)")
                .font(.headline)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
