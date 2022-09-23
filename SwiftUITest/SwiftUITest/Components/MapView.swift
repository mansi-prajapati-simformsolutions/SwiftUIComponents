//
//  MapView.swift
//  SwiftUITest
//
//  Created by Mansi Prajapati on 29/09/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var annotations = CityModel.annotations
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.5678, longitude: 70.7848), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))


    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
            MapMarker(coordinate: $0.coordinate)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
