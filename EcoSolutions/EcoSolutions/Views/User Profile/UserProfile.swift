//
//  UserProfile.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct UserProfile: View {
    var milestoneList: [Milestone]
    var body: some View {
        ScrollView {
            VStack {
                
                ZStack {
                    Circle()
                        .foregroundStyle(Color("inverted-accent"))
                    .frame(width: 190, height: 190)
                    
                    Image("srm")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 160, height: 160)
                }
                .padding()

                Text("Sebastián Rosas")
                    .foregroundStyle(.accent)
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("Información General")
                        .font(.title)
                        .foregroundStyle(.accent)
                    
                    Rectangle()
                        .background(Color("white-dark"))
                        .frame(maxWidth: 350,maxHeight: 1)
                    
                    Text("• Correo Electronico: ")
                        .bold()
                        + Text("rosassebastian2003@gmail.com")
                            .font(.footnote)
                    
                    Text("• Número de Telefono: ")
                        .bold()
                        + Text("+52 871 347 8779")
                            .foregroundStyle(.accent)
                            .font(.footnote)
                }
                .padding(.bottom, 50)
                
                VStack {
                    HStack {
                        Text("Hitos")
                            .font(.title)
                        .foregroundStyle(.accent)
                        .padding()
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .background(Color("white-dark"))
                        .frame(maxWidth: 350,maxHeight: 1)
                    
                    VStack {
                        
                        ForEach(milestoneList) {milestone in
                            MilestoneRow(milestone: milestone)
                            
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    UserProfile(milestoneList: [
        Milestone(id: "20 Carpools", isCompleted: true),
        Milestone(id: "Reduccion de tu huella en un 50%", isCompleted: false),
        Milestone(id: "Reduccion del uso de luz en 15%", isCompleted: false),
        Milestone(id: "There's only one solution for polution", isCompleted: true),

    ])
}
