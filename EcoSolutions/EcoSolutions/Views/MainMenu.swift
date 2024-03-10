//
//  MainMenu.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Mi Hogar")
                        .font(.title)
                        .foregroundStyle(.accent)
                    
                    MostAndLeastUsedDevicesComponent()
                    
                }
                
                Rectangle()
                    .background(Color("white-dark"))
                    .frame(maxWidth: 350,maxHeight: 1)
                
                VStack(alignment: .leading) {
                    Text("Mi Vehiculo")
                        .font(.title)
                        .foregroundStyle(.accent)
                    
                    CarComponent()
                    
                }
            }
            .padding()
        }
        
        
        
    }
}

#Preview {
    MainMenu()
}
