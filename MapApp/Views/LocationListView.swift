//
//  LocationListView.swift
//  MapApp
//
//  Created by Stellone Olivier on 08/11/2024.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var vm: LocationViewModel
    var body: some View {
        listView
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationViewModel())
}

extension LocationListView {
    
    private var listView: some View {
        List {
            ForEach (vm.locations) { location in
                Button {
                    vm.showDetails(location: location)
                } label: {
                    HStack {
                        if let imageName = location.imageNames.first {
                            Image(imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(location.name)
                                    .font(.headline)
                                
                                Text(location.cityName)
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }   
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .frame(maxHeight: .infinity)
    }
}
