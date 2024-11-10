//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Stellone Olivier on 08/11/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All locations:
    @Published var locations: [Location]
    
    @Published var selectedLocation: Location {
        didSet {
            updateMapRegion(location: selectedLocation)
        }
    }
    
    // Current Location Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show List of Location:
    @Published var showList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        //explicit unwrap
        self.selectedLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
     func toggleList() {
        withAnimation(.easeInOut) {
            showList.toggle()
           // showList = !showList
        }
    }
    
    func showDetails(location: Location) {
        withAnimation(.easeInOut) {
            selectedLocation = location
            showList = false
        }
    }
}
