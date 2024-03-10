//
//  ContentView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView(headerTittle: "Bienvenido Sebastian")
            
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "powerplug")
                    }
                HomeView()
                    .tabItem {
                        Label("Car", systemImage: "car.side")
                    }
                HomeView()
                    .tabItem {
                        Label("Main Menu", systemImage: "house")
                    }
                HomeView()
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
                HomeView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .background(Color("white-dark"))
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("Light Mode Preview")
                .environment(\.colorScheme, .light)

            ContentView()
                .previewDisplayName("Dark Mode Preview")
                .preferredColorScheme(.dark)
        }
    }
}
