//
//  ApplianceRow.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct ApplianceRow: View {
    let  applianceItem: Item
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: applianceItem.iconName)
                    .font(.system(size: 22))
                
                Text(applianceItem.name)
                
                Spacer()
                
                Text(String(format: "%.2f", applianceItem.consumo))
                    .font(.title2)// Display the float with two decimal places
                    + Text(" kg")
                    .font(.title2)
            }
            .padding()
            
            Rectangle()
                .background(Color("white-dark"))
                .frame(maxWidth: 350,maxHeight: 1)
        }
    }
}

#Preview {
    ApplianceRow(applianceItem: Item(consumo: 0.00, name: "Estufa", iconName: "stove", quantity: 0, smart: false))
}
