//
//  GraphView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import SwiftUI
import Charts

struct CO2EmissionsView: View {
    
    enum Timeframe: String, CaseIterable, Identifiable {
        case daily = "Diario"
        case weekly = "Semanal"
        case monthly = "Mensual"
        var id: Self { self }
    }

    @ObservedObject var emissionsViewModel: EmissionsViewModel
    @State private var selectedTimeframe = Timeframe.weekly
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTimeframe.animation(), label: Text("Timeframe")) {
                ForEach(Timeframe.allCases) { timeframe in
                    Text(timeframe.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Group {
                Text("Produciste")
                Text("\(emissionsViewModel.totalEmissions, specifier: "%.2f") kg CO2").bold().foregroundColor(Color.green) +
                Text(" en los ultimos 90 dias")
            }.padding(.vertical)
            
            // Dependiendo del marco de tiempo seleccionado, muestra el gráfico adecuado
            if #available(macOS 14.0, *) {
                switch selectedTimeframe {
                case .daily:
                    DailyEmissionsChartView(emissionsData: emissionsViewModel.emissionsData, threshold: 50.0)
                case .weekly:
                    Chart {
                        ForEach(emissionsViewModel.emissionsByWeek, id: \.week) { data in
                            BarMark(
                                x: .value("Week", data.week, unit: .weekOfYear),
                                y: .value("CO2 Emissions (kg)", data.amount)
                            )
                        }
                    }
                case .monthly:
                    Chart {
                        ForEach(emissionsViewModel.emissionsByMonth, id: \.month) { data in
                            BarMark(
                                x: .value("Month", data.month, unit: .month),
                                y: .value("CO2 Emissions (kg)", data.amount)
                            )
                        }
                    }
                }
            } else {
                Text("DailyEmissionsChartView is only available in macOS 14.0 or newer")
            }
            
            Spacer()
        }
        .padding()
    }
}

// Aquí la vista previa usando datos de ejemplo del ViewModel
@available(macOS 14.0, *)
struct CO2EmissionsView_Previews: PreviewProvider {
    static var previews: some View {
        CO2EmissionsView(emissionsViewModel: .preview)
    }
}
