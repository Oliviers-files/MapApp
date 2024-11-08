//
//  MapAppApp.swift
//  MapApp
//
//  Created by Stellone Olivier on 07/11/2024.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
