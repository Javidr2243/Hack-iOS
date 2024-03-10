//
//  CarView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 10/03/24.
//

import SwiftUI

struct CarView: View {
    
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
                    CarComponent()
                    
                    // Enlace interactivo
                    Button(action: {
                        if let url = URL(string: "https://www.example.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color("pear"))
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Considera compartir viaje con un amigo para disminuir la emisión Co2")
                                        .foregroundStyle(.black)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                    }
                    NavigationLink{
                        MapView()
                    } label:{
                        TripRegisterComponent()
                    }
                    SingleCarComponent()
                    }
                }
            }
        }
    }


#Preview {
    CarView( applianceList: [
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
    ])
}
