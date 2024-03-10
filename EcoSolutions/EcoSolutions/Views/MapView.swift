//
//  MapView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(interactionModes: [.rotate, .zoom])
    }
}

#Preview {
    MapView()
}
