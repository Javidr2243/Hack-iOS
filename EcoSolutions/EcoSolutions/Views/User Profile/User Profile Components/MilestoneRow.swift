//
//  MilestoneRow.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct MilestoneRow: View {
    let milestone: Milestone
    
    private var completionIcon: Image {
        switch milestone.isCompleted {
            case true:
                return Image(systemName: "star.circle.fill")
            case false:
                return Image(systemName: "star.circle")
            
        }
    }
    
    private var iconColor: Color {
        switch milestone.isCompleted {
            case true:
            return Color(.accent)
            case false:
                return Color("achievement-switch")
            
        }
    }
    
    var body: some View {
        VStack (alignment: .center){
            HStack {
                completionIcon
                    .font(.system(size: 22))
                    .foregroundStyle(iconColor)
                
                Text(milestone.id)
                
                Spacer()
            }
            .padding()
            
            Rectangle()
                .background(Color("white-dark"))
                .frame(maxWidth: 350,maxHeight: 1)
        }
    }
}

#Preview {
    MilestoneRow(milestone: Milestone(id: "one", isCompleted: true))
}
