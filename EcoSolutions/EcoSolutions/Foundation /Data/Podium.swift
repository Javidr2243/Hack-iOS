//
//  Podium.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import Foundation

enum Position {
    case first
    case second
    case third
}

struct Milestone: Identifiable {
    let id: String
    var isCompleted: Bool
}
