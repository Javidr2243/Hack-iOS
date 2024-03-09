//
//  User.swift
//  EcoBitacora
//
//  Created by Javier Davila on 09/03/24.
//

//User contiene User, name, mail, id, password
//Car contiene model, uso de gasolina por km, trips
//Trips contiene distancia del viaje y duración


import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let mail: String
    let password: String
    var cars: [Car] // Cambiado a un array para permitir múltiples coches.
}

struct Car: Codable {
    let model: String
    let gasConsumption: Double // Mantiene la precisión como Double.
    var trips: [Trips] // Puede contener múltiples viajes.
}

struct Trips: Codable {
    let distance: Double
    let duration: Int
}

struct Home: Codable {
    var name: String
    var user: [User]
    var appliances: [Item]
}


struct Item: Codable {
    // Variables inmutables
    let category: String
    let consumo: Int
    
    var name: String
    var quantity: Int
    var smart: Bool
}
