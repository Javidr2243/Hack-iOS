//
//  SimpleC02EmissionsView.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import SwiftUI
import Charts

struct SimpleCO2EmissionsView: View {
    
    @ObservedObject var emissionsViewModel: EmissionsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let changedEmissions = changedEmissions() {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: isPositiveChange ? "arrow.up.right" : "arrow.down.right").bold()
                        .foregroundColor(isPositiveChange ? .red : .green)
                    
                    Text("Tus emisiones de CO2 ") +
                    Text(changedEmissions)
                        .bold() +
                    Text(" en los últimos 30 días.")
                }
            }
            
            Chart {
                ForEach(emissionsViewModel.emissionsByWeek, id: \.week) { data in
                    BarMark(
                        x: .value("Week", data.week, unit: .weekOfYear),
                        y: .value("Emissions", data.amount)
                    )
                }
            }
            .frame(height: 300)
        }
    }
    
    func changedEmissions() -> String? {
        let percentageChange = calculatePercentageChange()
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentageChange)) else {
            return nil
        }
        
        let changedDescription = percentageChange < 0 ? "disminuyeron por " : "aumentaron por "
        
        return changedDescription + formattedPercentage
    }
    
    func calculatePercentageChange() -> Double {
        if emissionsViewModel.previousEmissions == 0 {
            return 0
        }
        return (emissionsViewModel.currentEmissions / emissionsViewModel.previousEmissions) - 1
    }
    
    var isPositiveChange: Bool {
        calculatePercentageChange() > 0
    }
}

struct SimpleCO2EmissionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmissionsViewModel.preview
        return SimpleCO2EmissionsView(emissionsViewModel: viewModel)
            .padding()
    }
}
