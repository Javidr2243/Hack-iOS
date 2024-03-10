//
//  HomeView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                // Place Holder
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color("pear"))
                        .frame(width: 390, height:340)
                    Text("Graph ")
                        .scaleEffect(2)
                }
                
                MostAndLeastUsedDevicesComponent()
                
            }
        }
    }
}

#Preview {
    HomeView()
}
