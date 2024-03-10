//
//  Emissions.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import Foundation

struct Emission: Identifiable, Equatable {
    let id: UUID
    let date: Date
    let amount: Double // kg de CO2
    
    // Generar ejemplos de emisiones
    static var examples: [Emission] {
        (1...10).map { item in
            Emission(id: UUID(), date: Date().addingTimeInterval(-86400 * Double(item)), amount: Double.random(in: 1...100))
        }
    }
}

