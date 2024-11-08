//
//  Location.swift
//  MapApp
//
//  Created by Stellone Olivier on 07/11/2024.
//

import Foundation
import MapKit

struct Location: Identifiable {
    var id: String { name + cityName }
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}
