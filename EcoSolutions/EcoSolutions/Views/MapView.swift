//
//  MapView.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/9/24.
//


import SwiftUI
import MapKit

struct MapView: View {
    @State private var selectedResult: MKMapItem?
    @State private var route: MKRoute?
    @State private var searchText = ""
    
    private let startingPoint = CLLocationCoordinate2D(
        latitude: 40.83657722488077,
        longitude: 14.306896671048852
    )
    
    private let destinationCoordinates = CLLocationCoordinate2D(
        latitude: 40.849761,
        longitude: 14.263364
    )
    
    private var travelTime: String? {
        guard let route = route else { return nil }
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: route.expectedTravelTime)
    }
    
    private var travelDistance: String? {
        guard let route = route else { return nil }
        
        let formatter = MeasurementFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        numberFormatter.decimalSeparator = "."
        formatter.numberFormatter = numberFormatter
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        
        let distanceInKilometers = Measurement(value: route.distance / 1000, unit: UnitLength.kilometers)
        
        return formatter.string(from: distanceInKilometers)
    }
    
    var body: some View {
        VStack {
            TextField("Buscar", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Map(selection: $selectedResult) {
                Marker("Start", coordinate: self.startingPoint)
                if let route = route {
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
            }
            
            HStack {
                if let travelTime = travelTime {
                    Text("Tiempo: \(travelTime)")
                        .padding()
                }
                
                if let travelDistance = travelDistance {
                    Text("Distancia: \(travelDistance)")
                        .padding()
                }
            }
            Text("Emisión estimada de Co2: 0.8kg ")
        }
        .onChange(of: selectedResult) {
            getDirections()
        }
        .onAppear {
            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationCoordinates))
        }
    }
    
    func getDirections() {
        self.route = nil
        
        guard let selectedResult = selectedResult else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.startingPoint))
        request.destination = selectedResult
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
}


#Preview {
    MapView()
}
