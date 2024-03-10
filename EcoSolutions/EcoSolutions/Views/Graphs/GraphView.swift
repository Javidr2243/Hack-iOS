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
    let thresholdWeekly: Double = 50.0 // Define el umbral para el gráfico semanal
    let thresholdMonthly: Double = 140.0 // Define el umbral para el gráfico mensual
    
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
            
            if #available(macOS 14.0, *) {
                switch selectedTimeframe {
                case .daily:
                    DailyEmissionsChartView(emissionsData: emissionsViewModel.emissionsData, threshold: 7.0)
                case .weekly:
                    Chart {
                        ForEach(emissionsViewModel.emissionsByWeek, id: \.week) { data in
                            BarMark(
                                x: .value("Week", data.week, unit: .weekOfYear),
                                y: .value("CO2 Emissions (kg)", data.amount)
                            )
                        }
                        RuleMark(y: .value("Threshold", thresholdWeekly))
                            .foregroundStyle(.red)
                            .lineStyle(StrokeStyle(lineWidth: 2))
                            .annotation(position: .top, alignment: .trailing) {
                                Text("Umbral: \(thresholdWeekly, specifier: "%.1f") kg")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(3)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(4)
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
                        RuleMark(y: .value("Threshold", thresholdMonthly))
                            .foregroundStyle(.red)
                            .lineStyle(StrokeStyle(lineWidth: 2))
                            .annotation(position: .top, alignment: .trailing) {
                                Text("Umbral: \(thresholdMonthly, specifier: "%.1f") kg")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(3)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(4)
                            }
                    }
                }
            } else {
                Text("Charts are only available in macOS 14.0 or newer")
            }
            
            Spacer()
        }
        .padding()
    }
}

@available(macOS 14.0, *)
struct CO2EmissionsView_Previews: PreviewProvider {
    static var previews: some View {
        CO2EmissionsView(emissionsViewModel: .preview)
    }
}
