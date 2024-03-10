//
//  AddDevice.swift
//  EcoSolutions
//
//  Created by Javier Davila on 10/03/24.
//

import SwiftUI

struct AddDevice: View {
    @State private var selectedDevice = "Lavadora"  // Estado para almacenar el dispositivo seleccionado.
    let devices = ["Lavadora", "Refrigerador", "Televisor", "Aire acondicionado"]  // Lista de dispositivos.

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 15) {
                
                
                // Lista desplegable
                Menu {
                    Picker("Selecciona el electrodoméstico", selection: $selectedDevice) {
                        ForEach(devices, id: \.self) { device in
                            Text(device).tag(device)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedDevice)
                        Spacer()
                        Image(systemName: "chevron.down")  // Ícono para indicar que es desplegable
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    Text("Agregar")
                    
                    
                    
                }
            }
            .padding()
            
        }
    }
    
}

struct AddDevice_Previews: PreviewProvider {
    static var previews: some View {
        AddDevice()
    }
}
