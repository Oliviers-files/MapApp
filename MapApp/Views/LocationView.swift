//
//  LocationView.swift
//  MapApp
//
//  Created by Stellone Olivier on 08/11/2024.
//

import SwiftUI
import MapKit
// 25.195919942264698, 55.27763726041547
extension CLLocationCoordinate2D {
    static let mapRegion = CLLocationCoordinate2D(latitude: 25.19577, longitude: 55.27776)
}
struct LocationView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        Map {
            Marker("Apple Store",coordinate: .mapRegion)
        }
        .mapStyle(.standard(elevation: .realistic))
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
