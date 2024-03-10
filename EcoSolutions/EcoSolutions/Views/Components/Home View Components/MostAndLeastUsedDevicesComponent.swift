//
//  MostAndLeastUsedDevicesComponent.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct MostAndLeastUsedDevicesComponent: View {
    var body: some View {
        // Most Used Device
        VStack {
            VStack(alignment: .leading){
                Text("Aparato mas usado")
                    .font(.caption)

                HStack {
                    Image(systemName: "creditcard")
                    
                    Text("Aire Acondicionado")
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
                        
                        Text("34.65 kg")
                            .foregroundStyle(.red)
                        
                    }
                }
            }
            .padding()
            
            // Most Used Device
            VStack(alignment: .leading){
                Text("Aparato menos usado")
                    .font(.caption)
                
                HStack {
                    Image(systemName: "rectangle.on.rectangle")
                    
                    Text("Tostadora")
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
                        
                        Text("34.65 kg")
                            .foregroundStyle(Color("castleton-green"))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MostAndLeastUsedDevicesComponent()
}
