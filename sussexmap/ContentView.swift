//
//  ContentView.swift
//  example
//
//  Created by Lewis Rye on 09/10/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //this is the location of the university that will create the default view of the map
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.863999, longitude: -0.085001),
        span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
    
    @State private var defaultl = "University of Sussex"
    
    @State private var isHidden = true
    
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
                 location: CLLocationCoordinate2D(latitude: 50.872258, longitude: -0.089146)),
        Location(name: "Falmer House",
                 description: "Student Union",
                 location: CLLocationCoordinate2D(latitude: 50.864599, longitude: -0.088551))
    ]
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                showsUserLocation: true,
                annotationItems: locations) {
                MapMarker(coordinate: $0.location)
            }
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .edgesIgnoringSafeArea(.all)
            
            let view : some View = InformationView()
                .background(Color.white)
                .offset(y: UIScreen.main.bounds.maxY - (UIScreen.main.bounds.maxY * 0.60))
            view.opacity(1) // change to 1/0 etc
            /*
             VERY IMPORTANT LINE
             */
            HStack {
                Spacer()
                Spacer()
                Text("Map")
                    .bold()
                Spacer()
                Spacer()
                Spacer()
                Text("Select a Building:")
                Picker("", selection: $defaultl) {
                    ForEach(locations) { location in
                        Text(location.name)
                    }
                }
                .pickerStyle(.menu)
                Spacer()
            }
            .background(Color.white)
            .offset(y: -1 * (UIScreen.main.bounds.maxY / 2.25))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
