//
//  Menu.swift
//  Little Lemon
//
//  Created by Jiří Uherek on 16.01.2025.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading, spacing:20) {
            Text("Little Lemon")
                .font(.title)
            Text("Chicago")
                .font(.title)
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            List{}
        }
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
