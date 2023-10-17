//
//  InformationView.swift
//  example
//
//  Created by Lewis Rye on 16/10/2023.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack {
            CircleView()
                .offset(y: -150)
            
            VStack(alignment: .leading) {
                Text("{building name}")
                    .font(.title)
                    .foregroundColor(.blue)
                HStack {
                    Text("University of Sussex")
                        .font(.subheadline)
                    Spacer()
                    Text("Brighton, {postcode}")
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About")
                    .font(.title2)
                    .foregroundColor(.blue)
                Text("{write information here}").lineLimit(nil)
            }
            .offset(y: -150)
            .padding()
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
