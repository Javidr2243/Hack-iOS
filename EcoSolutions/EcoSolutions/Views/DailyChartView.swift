//
//  DailyChartView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import SwiftUI
import Charts

@available(macOS 14.0, *)
struct DailyEmissionsChartView: View {
    
    let emissionsData: [Emission]
    let threshold: Double // Propiedad para el valor de la línea horizontal
    
    init(emissionsData: [Emission], threshold: Double) {
        self.emissionsData = emissionsData
        self.threshold = threshold
        
        guard let lastDate = emissionsData.last?.date else { return }
        self._scrollPosition = State(initialValue: lastDate.timeIntervalSinceReferenceDate)
    }

    let numberOfDisplayedDays = 30
    
    @State var scrollPosition: TimeInterval = TimeInterval()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Chart {
                ForEach(emissionsData, id: \.date) { data in
                    BarMark(
                        x: .value("Day", data.date, unit: .day),
                        y: .value("CO2 Emissions", data.amount)
                    )
                }
                
                RuleMark(
                    y: .value("Threshold", threshold)
                )
                .foregroundStyle(.red) // Puedes cambiar el color de la línea aquí
                .annotation(position: .top, alignment: .trailing) {
                    Text("Umbral: \(threshold, specifier: "%.1f")")
                        .bold()
                }
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayedDays)
            .chartScrollTargetBehavior(
                .valueAligned(
                    matching: .init(hour: 0),
                    majorAlignment: .matching(.init(day: 1))))
            .chartScrollPosition(x: $scrollPosition)
            
        }
    }
}

@available(macOS 14.0, *)
struct DailyEmissionsChartView_Previews: PreviewProvider {
    static var previews: some View {
        DailyEmissionsChartView(emissionsData: EmissionsViewModel.preview.emissionsData, threshold: 50.0)
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
