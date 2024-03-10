//
//  ApplianceSummaryComponent.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct ApplianceSummaryComponent: View {
    var applianceList: ItemCategory

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                // White bg to avoid tweeking dark mode settings
                Color(.white)
                ZStack {
                    // Category container
                    Color("pear")
                        .opacity(0.5)
                    
                    Text(applianceList.id)
                        .foregroundStyle(Color("castleton-green"))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: 140, height: 40)
            
            // Item list
            ForEach(applianceList.items, id: \.name) {item in
                ApplianceRow(applianceItem: item)
                
            }
        }
        .padding()
    }
}

#Preview {
    ApplianceSummaryComponent(
        applianceList: ItemCategory(
            id: "Aseo",
            items: [
                Item(consumo: 10.0, name: "Item 1", iconName: "stove", quantity: 2, smart: true),
                Item(consumo: 15.0, name: "Item 2", iconName: "eraser", quantity: 1, smart: false)
                // Add more items as needed
            ]
        )
    )
}
