//
//  SingleCarComponent.swift
//  EcoSolutions
//
//  Created by Javier Davila on 10/03/24.
//

import SwiftUI

struct SingleCarComponent: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Tu automóvil")
                    .font(.caption)
                Spacer()
                Text("Consumo")
                    .padding(.trailing, 35.0)
                    .font(.caption)
                    
            }
            HStack {
                Image(systemName: "car")
                
                Text("Nissan Versa 2020")
                    .minimumScaleFactor(0.5)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.white)
                        .frame(width: 115, height: 30)
                    
                    /*RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.gray)
                        .opacity(0.3)
                        .frame(width: 115, height: 30)
                    */
                    Text("15 km/L")
                        .foregroundStyle(.black)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    SingleCarComponent()
}
