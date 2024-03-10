//
//  LeaderBoardView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

// Fix VStack for later

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        ScrollView {
            VStack {
                PodiumView()
                
                VStack{
                    LeaderBoardRow(number: 1, consumo: 34.0, userName: "Sebastian Rosas")
                    LeaderBoardRow(number: 2, consumo: 29.5, userName: "Javier Davila")
                    LeaderBoardRow(number: 3, consumo: 25.2, userName: "Alejandro Martinez")
                    LeaderBoardRow(number: 4, consumo: 22.8, userName: "Alex Johnson")
                    LeaderBoardRow(number: 5, consumo: 20.1, userName: "Emily Williams")
                    LeaderBoardRow(number: 6, consumo: 18.5, userName: "Daniel Brown")
                    LeaderBoardRow(number: 7, consumo: 16.9, userName: "Sophia Taylor")
                    LeaderBoardRow(number: 8, consumo: 14.3, userName: "William Davis")
                    LeaderBoardRow(number: 9, consumo: 12.7, userName: "Olivia Martinez")
                    LeaderBoardRow(number: 10, consumo: 10.0, userName: "Liam Garcia")
                }
                .padding(.bottom, 50)
                
                VStack {
                    Text("Añade amigos")
                        .foregroundStyle(.accent)
                    .font(.title2)
                    
                    VStack {
                        FriendRow(userName: "Jane Smith")
                        FriendRow(userName: "Sophie Turner")
                        FriendRow(userName: "Benjamin Lee")
                        FriendRow(userName: "Elena Rodriguez")
                    }
                }

            }
            
        }
    
    }
}

#Preview {
    LeaderBoardView()
}
