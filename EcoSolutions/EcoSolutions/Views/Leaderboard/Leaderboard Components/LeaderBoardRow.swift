//
//  LeaderBoardRow.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct LeaderBoardRow: View {
    var number: Int
    var consumo: Float
    var userName: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color("pear"))
                        .frame(width: 40, height: 40)
                        .opacity(number <= 3 ? 1 : 0)
                    
                    Text("\(number)")
                        .bold()
                }
                
                Text(userName)
                
                Spacer()
                
                Text(String(format: "%.2f", consumo))
                    .font(.title2)// Display the float with two decimal places
                    + Text(" kg")
                    .font(.title2)
            }
            .padding()
            
            Rectangle()
                .background(Color("white-dark"))
                .frame(maxWidth: 350,maxHeight: 1)
        }
        .frame(maxWidth: 400)
    }
}

#Preview {
    LeaderBoardRow(number: 10, consumo: 34.0, userName: "Sebastian Rosas")
}
