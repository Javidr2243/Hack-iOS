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
                HomeView(
                    applianceList: [
                        ItemCategory(
                            id: "Cocina",
                            items: [
                                Item(consumo: 10.0, name: "Estufa", iconName: "stove", quantity: 2, smart: true),
                                Item(consumo: 15.0, name: "Licuadora", iconName: "eraser", quantity: 1, smart: false)
                            ]
                        ),
                        ItemCategory(
                            id: "Aseo",
                            items: [
                                Item(consumo: 8.0, name: "Aspiradora", iconName: "stove", quantity: 1, smart: true),
                                Item(consumo: 12.0, name: "Lavadora", iconName: "eraser", quantity: 2, smart: false)
                            ]
                        ),
                        // Add more categories as needed
                    ]
                )
                    .tabItem {
                        Label("Home", systemImage: "powerplug")
                    }
                MapView()
                    .tabItem {
                        Label("Car", systemImage: "car.side")
                    }
                MapView()
                    .tabItem {
                        Label("Main Menu", systemImage: "house")
                    }
                MapView()
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
                MapView()
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
