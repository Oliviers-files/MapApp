//
//  LocationDetailsView.swift
//  MapApp
//
//  Created by Stellone Olivier on 12/11/2024.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    ForEach(location.imageNames, id: \.self) {
                        Image($0)
                            .resizable()
                            .scaledToFill()
                            .frame(width:UIScreen.main.bounds.width)
                            .clipped()
                    }
                }
                .frame(height: 500)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .tabViewStyle(PageTabViewStyle())
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(location.name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        
                        Text(location.cityName)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(location.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    if let url = URL(string: location.link) {
                        Link("Read more on wikipedia", destination: url)
                            .font(.headline)
                            .tint(.blue)
                    }
                    
                    Divider()
                VStack {
                        Map(coordinateRegion: .constant(MKCoordinateRegion(
                            center: location.coordinates,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))),
                            annotationItems: [location] ) { location in
                            MapAnnotation(coordinate: location.coordinates) {
                                LocationPinView()
                                    .shadow(radius: 20)
                            }
                        }
                            .allowsHitTesting(false)
                    }
                    
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
            .overlay(backButton ,alignment: .topLeading)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationDetailsView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationViewModel())
}

extension LocationDetailsView {
        private var backButton: some View {
            Button {
                vm.showDetailsSheet = nil
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(16)
                    .background(.ultraThickMaterial)
                    .clipShape(Circle())
                    .padding(.top, 50)
                    .padding(.leading)
                    .shadow(color: Color.black.opacity(0.5), radius: 10)
            }
        }
}
