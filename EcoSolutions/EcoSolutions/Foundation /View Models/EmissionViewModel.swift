//
//  EmissionViewModel.swift
//  EcoSolutions
//
//  Created by Javier Davila on 09/03/24.
//

import Foundation

class EmissionsViewModel: ObservableObject {
    @Published var emissionsData: [Emission]
    
    // Calcular las emisiones totales
    var totalEmissions: Double {
        emissionsData.reduce(0) { $0 + $1.amount }
    }
    
    // Agrupar las emisiones por día
    var emissionsByDay: [(day: Date, amount: Double)] {
        Dictionary(grouping: emissionsData, by: { $0.date.startOfDay }).map { (date, emissions) in
            (date, emissions.reduce(0) { $0 + $1.amount })
        }.sorted { $0.day < $1.day }
    }
    
    // Agrupar las emisiones por semana
    var emissionsByWeek: [(week: Date, amount: Double)] {
        Dictionary(grouping: emissionsData, by: { $0.date.startOfWeek }).map { (week, emissions) in
            (week, emissions.reduce(0) { $0 + $1.amount })
        }.sorted { $0.week < $1.week }
    }
    
    // Agrupar las emisiones por mes
    var emissionsByMonth: [(month: Date, amount: Double)] {
        Dictionary(grouping: emissionsData, by: { $0.date.startOfMonth }).map { (month, emissions) in
            (month, emissions.reduce(0) { $0 + $1.amount })
        }.sorted { $0.month < $1.month }
    }
    
    // Calcular las emisiones actuales y pasadas
    var currentEmissions: Double {
        emissionsData.filter { $0.date > Date().addingTimeInterval(-30*24*60*60) }.reduce(0) { $0 + $1.amount }
    }

    var previousEmissions: Double {
        emissionsData.filter { $0.date <= Date().addingTimeInterval(-30*24*60*60) && $0.date > Date().addingTimeInterval(-60*24*60*60) }.reduce(0) { $0 + $1.amount }
    }
    
    init(emissionsData: [Emission] = []) {
        self.emissionsData = emissionsData
    }
    
    static var preview: EmissionsViewModel {
        let lastMonthEmissions = (1...30).map { day in
            Emission(id: UUID(), date: Date().addingTimeInterval(-Double(day) * 86400), amount: Double.random(in: 50...100))
        }
        
        let previousMonthEmissions = (1...30).map { day in
            Emission(id: UUID(), date: Date().addingTimeInterval(-Double(day) * 86400 - 30*86400), amount: Double.random(in: 50...100))
        }
        
        return EmissionsViewModel(emissionsData: lastMonthEmissions + previousMonthEmissions)
    }
}

// Extensiones para calcular el inicio del día, la semana y el mes
extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    var startOfWeek: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? self
    }

    var startOfMonth: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self)) ?? self
    }
}
