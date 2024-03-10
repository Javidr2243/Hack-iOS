//
//  MapDataView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct MapDataView: View {
    var time, distance: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tiempo Estimado: ")
                .foregroundStyle(.red)
                .bold()
            + Text("\(time) min")
            
            Text("Distancia: ")
                .foregroundStyle(.red)
                .bold()
            + Text("\(time) km")

            Text("Emision Estimada de Co2: ")
                .foregroundStyle(.red)
                .bold()
            + Text("0.8 kg")
        }
        .padding() // Add padding for better visibility of the background
        .background(Color("white-dark")) // Replace "YourBackgroundColor" with your desired color
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .frame(maxWidth: 350)
        .shadow(radius: 20)
    }
}

#Preview {
    MapDataView(time: "10", distance: "20")
}
