//
//  PodiumView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct PodiumView: View {
    var body: some View {
        HStack {
            PodiumPlaceHolder(scale: 0.8, userName: "Javier Davila", position: .second)
            PodiumPlaceHolder(scale: 1, userName: "Sebastian Rosas", position: .first)
            PodiumPlaceHolder(scale: 0.8, userName: "Alejandro Martinez", position: .third)
        }
        .scaleEffect(0.7)
        
    }
}

#Preview {
    PodiumView()
}
