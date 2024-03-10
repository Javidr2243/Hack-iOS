//
//  LoadingPage.swift
//  EcoSolutions
//
//  Created by Sebastian Rosas Maciel on 3/10/24.
//

import SwiftUI

struct LoadingPage: View {
    var body: some View {
        Rectangle()
            .fill(Color("pear"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LoadingPage()
}
