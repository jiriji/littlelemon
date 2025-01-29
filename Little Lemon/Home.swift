//
//  Home.swift
//  Little Lemon
//
//  Created by Jiří Uherek on 16.01.2025.
//

import SwiftUI
import CoreData

struct Home: View {

    let persistence = PersistenceController.shared
    
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
                .navigationBarBackButtonHidden(false)
        }
        .environment(\.managedObjectContext, persistence.container.viewContext)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
