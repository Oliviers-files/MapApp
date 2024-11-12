//
//  LocationPreView.swift
//  MapApp
//
//  Created by Stellone Olivier on 10/11/2024.
//

import SwiftUI

struct LocationPreView: View {
    @EnvironmentObject private var vm : LocationViewModel
    let location : Location
    var body: some View {
        HStack (alignment: .bottom, spacing: 0){
            VStack(spacing: 16) {
                ZStack {
                    if let imageName = location.imageNames.first {
                        Image(imageName)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                        
                    }
                }
                .padding(6)
                .background(.white)
                .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(location.cityName)
                        .font(.subheadline)
                }
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                Button {
                    vm.showDetailsSheet = location
                } label: {
                    Text("Learn More")
                        .font(.headline)
                        .frame(width: 125, height: 35)
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                
                Button {
                    vm.nextButtonTapped()
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(width: 125, height: 35)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
            .padding()
    }
}
