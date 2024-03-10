//
//  FriendRow.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct FriendRow: View {
    var userName: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .center) {
                    Image(systemName: "person.circle")
                        .foregroundStyle(.accent)
                        .font(.system(size: 35))
                }
                
                Text(userName)
                
                Spacer()
                
    
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
    FriendRow(userName: "Sebastian Rosas")
}
