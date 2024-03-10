//
//  LoadingPage.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct LoadingPage: View {
    @Binding var isLoading: Bool
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color("pear"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .colorMultiply(.white)
            
        }
        .opacity(isLoading ? 1 : 0) // Use the isLoading binding here
        .animation(.easeInOut(duration: 0.5)) // Adjust duration as needed
    }
}


