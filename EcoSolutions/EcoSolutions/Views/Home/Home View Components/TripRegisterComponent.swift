//
//  TripRegisterComponent.swift
//  EcoSolutions
//
//  Created by Javier Davila on 10/03/24.
//

import SwiftUI

struct TripRegisterComponent: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Registro semanal")
                    .font(.caption)
                Spacer()
                Text("Viajes en la semana")
                    .padding(.trailing, 10.0)
                    .font(.caption)
                    
            }
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text("Agregar viaje +")
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
                    
                    Text("12")
                        .foregroundStyle(.black)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    TripRegisterComponent()
}
