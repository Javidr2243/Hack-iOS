//
//  CarComponent.swift
//  EcoSolutions
//
//  Created by Javier Davila on 10/03/24.
//

import SwiftUI

struct CarComponent: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Uso semanal")
                    .font(.caption)

                HStack {
                    Image(systemName: "car.side")
                    
                    Text("Km recorridos")
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white)
                            .frame(width: 115, height: 30)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.red)
                            .opacity(0.3)
                            .frame(width: 115, height: 30)
                        
                        Text("50 km")
                            .foregroundStyle(.red)
                        
                    }
                }
            }
            .padding()
            
            // Most Used Device
            VStack(alignment: .leading){
                Text("Emisión de Co2")
                    .font(.caption)
                
                HStack {
                    Image(systemName: "smoke")
                    
                    Text("Kg de Co2 totales")
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white)
                            .frame(width: 115, height: 30)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color("pear"))
                            .opacity(0.3)
                            .frame(width: 115, height: 30)
                        
                        Text("129 kg")
                            .foregroundStyle(Color("castleton-green"))
                    }
                }
            }
            .padding()
        }    }
}

#Preview {
    CarComponent()
}
