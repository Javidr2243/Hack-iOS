//
//  ContentView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    @State private var isLoading = true
    
    // Replace index 0 with actual text from User instance
    var headerTittles = ["Mi Hogar", "Mi Vehiculo", "Bienvenido Sebastian", "Logros", "Perfil"]
    var body: some View {
        
        ZStack {
            VStack {
                HeaderView(headerTittle: headerTittles[selectedTab])
                
                TabView(selection: $selectedTab) {
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
                        .tag(0)
                    
                    CarView(applianceList: [
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
                    ])
                        .tabItem {
                            Label("Car", systemImage: "car.side")
                        }
                        .tag(1)
                    
                    MainMenu()
                        .tabItem {
                            Label("Main Menu", systemImage: "house")
                        }
                        .tag(2)
                    
                    LeaderBoardView()
                        .tabItem {
                            Label("Leader Board", systemImage: "trophy")
                        }
                        .tag(3)
                    
                    UserProfile(milestoneList: [
                        Milestone(id: "20 Carpools", isCompleted: true),
                        Milestone(id: "Reduccion de tu huella en un 50%", isCompleted: false),
                        Milestone(id: "Reduccion del uso de luz en 15%", isCompleted: false),
                        Milestone(id: "There's only one solution for polution", isCompleted: true)
                    ])
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                        .tag(4)
                }
                .background(Color("white-dark"))
                
                
                Spacer()
                
            }
            
            LoadingPage(isLoading: $isLoading).onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
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
