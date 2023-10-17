//
//  CircleImage.swift
//  example
//
//  Created by Lewis Rye on 09/10/2023.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Image("chi_1")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
