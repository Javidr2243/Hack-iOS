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
    
    init(emissionsData: [Emission]) {
        self.emissionsData = emissionsData
        
        guard let lastDate = emissionsData.last?.date else { return }
        // Ajustar para que el punto inicial del desplazamiento sea el último día en tus datos.
        self._scrollPosition = State(initialValue: lastDate.timeIntervalSinceReferenceDate)
    }

    let numberOfDisplayedDays = 30
    
    @State var scrollPosition: TimeInterval = TimeInterval()
    
    var scrollPositionStart: Date {
        Date(timeIntervalSinceReferenceDate: scrollPosition)
    }
    
    var scrollPositionEnd: Date {
        scrollPositionStart.addingTimeInterval(Double(3600 * 24 * numberOfDisplayedDays))
    }

    
    var scrollPositionString: String {
        scrollPositionStart.formatted(.dateTime.month().day())
    }
    
    var scrollPositionEndString: String {
        scrollPositionEnd.formatted(.dateTime.month().day().year())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("\(scrollPositionString) – \(scrollPositionEndString)")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Chart(emissionsData, id: \.date) {
                BarMark(
                    x: .value("Day", $0.date, unit: .day),
                    y: .value("CO2 Emissions", $0.amount)
                )
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayedDays) // shows 30 days
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
        DailyEmissionsChartView(emissionsData: EmissionsViewModel.preview.emissionsData)
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
