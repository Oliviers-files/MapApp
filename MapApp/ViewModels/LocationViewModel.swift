//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Stellone Olivier on 08/11/2024.
//

import Foundation
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All locations:
    @Published var locations: [Location]
    
    @Published var selectedLocation: Location
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        //explicit unwrap
        self.selectedLocation = locations.first!
    }
}
