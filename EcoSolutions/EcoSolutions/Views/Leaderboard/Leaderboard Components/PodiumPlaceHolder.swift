//
//  PodiumPlaceHolder.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct PodiumPlaceHolder: View {
    var scale: CGFloat
    var userName: String
    var position: Position
    
    private var color: Color {
        switch(position) {
        case .first:
            return Color("pear")
            
        case .second:
            return Color("indian-yellow")
            
        case .third:
            return Color("pale-lavender")
        }
    }
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .center) {
                Image(systemName: "hexagon")
                    .font(.system(size: 140))
                
                Image(systemName: "hexagon.fill")
                    .font(.system(size: 100))
            }
            .foregroundStyle(color)
            
            Text(userName)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.3)
                .font(.title3)
                .bold()
        }
        .scaleEffect(scale)
    }
}


#Preview {
    PodiumPlaceHolder(scale: 1, userName: "Alejandro Martinez", position: .third)
}
