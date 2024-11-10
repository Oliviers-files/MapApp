//
//  LocationView.swift
//  MapApp
//
//  Created by Stellone Olivier on 08/11/2024.
//

import SwiftUI
import MapKit
// 25.195919942264698, 55.27763726041547
//extension CLLocationCoordinate2D {
//    static let mapRegion = CLLocationCoordinate2D(latitude: 25.19577, longitude: 55.27776)
//}
struct LocationView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
            
            header
                .padding()
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView {
     
    private var header: some View {
        VStack {
            Button {
                vm.toggleList()
            } label: {
           Text(vm.selectedLocation.name + ", " + vm.selectedLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.selectedLocation)
                .overlay (alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.title)
                        .padding()
                    //
                        .rotationEffect(Angle(degrees: vm.showList ? 180 : 0))
                }
        }
            
            if vm.showList {
                LocationListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .frame(height: 700, alignment: .top)
    }
}
