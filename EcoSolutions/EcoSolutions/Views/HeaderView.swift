//
//  HeaderView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct HeaderView: View {
    var headerTittle: String
    
    var body: some View {
        HStack {
            Text(headerTittle)
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            
            Spacer()
            
            Image(systemName: "list.bullet")
                .font(.system(size: 30))
        }
        .padding()
        .frame(maxHeight: 100)
        .background(Color("white-dark"))
        .shadow(radius: 10)
    }
}

#Preview {
    HeaderView(headerTittle: "Bienvenido Sebastian")
}
