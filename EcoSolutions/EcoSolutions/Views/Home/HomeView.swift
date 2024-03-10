//
//  HomeView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var emissionsViewModel: EmissionsViewModel = .preview
   
    var applianceList: [ItemCategory]
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    // Place Holder
                    NavigationLink{
                        CO2EmissionsView(emissionsViewModel: emissionsViewModel)
                    } label: {
                        SimpleCO2EmissionsView(emissionsViewModel: emissionsViewModel)
                            .padding()
                    }
                    
                    
                    // Most and Least Used device
                    MostAndLeastUsedDevicesComponent()
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color("pear"))
                        
                        VStack(alignment: .leading) {
                            Text("Descubre como reducir tu uso de aire acondicionado con los siguientes pasos")
                        }
                        .padding()
                        
                    }
                    
                    ForEach(applianceList) {item in
                        ApplianceSummaryComponent(applianceList: item)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView(
        applianceList: [
            ItemCategory(
                id: "Cocina",
                items: [
                    Item(consumo: 10.0, name: "Estufa", iconName: "stove", quantity: 2, smart: true),
                    Item(consumo: 15.0, name: "Licuadora", iconName: "eraser", quantity: 1, smart: false)
                ]
            ),
            ItemCategory(
                id: "Aseo",
                items: [
                    Item(consumo: 8.0, name: "Aspiradora", iconName: "stove", quantity: 1, smart: true),
                    Item(consumo: 12.0, name: "Lavadora", iconName: "eraser", quantity: 2, smart: false)
                ]
            ),
            // Add more categories as needed
        ]
    )
}
