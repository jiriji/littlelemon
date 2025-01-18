//
//  Home.swift
//  Little Lemon
//
//  Created by Jiří Uherek on 16.01.2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem{
                    Label("Profile", systemImage: "square.and.pencil")
                }
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
