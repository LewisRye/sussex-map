//
//  MapView.swift
//  example
//
//  Created by Lewis Rye on 09/10/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    //this is the location of the university that will create the default view of the map
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.867784, longitude: -0.087519), span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
    
    struct Location: Identifiable {
        let id = UUID()
        var name: String
        var description: String
        var location: CLLocationCoordinate2D
    }
    
    let locations = [
        Location(name: "Chichester I",
                 description: "Department of Engineering and Informatics",
                 location: CLLocationCoordinate2D(latitude: 50.865777, longitude: -0.087555)),
        Location(name: "Pevensey I",
                 description: "Department of Psychology",
                 location: CLLocationCoordinate2D(latitude: 50.864756, longitude: -0.086884)),
        Location(name: "Northfield Bar",
                 description: "Student Bar",
                 location: CLLocationCoordinate2D(latitude: 50.872258, longitude: -0.089146))
    ]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locations) {
                MapMarker(coordinate: $0.location)
            }
            .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(.all)
            ContentView()
                .offset(y: 333)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
