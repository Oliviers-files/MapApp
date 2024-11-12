//
//  LocationPinView.swift
//  MapApp
//
//  Created by Stellone Olivier on 11/11/2024.
//

import SwiftUI

struct LocationPinView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        ZStack {
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.thickMaterial)
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: 35)
            
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .font(.headline)
                .foregroundStyle(Color.blue)
                .padding(7)
                .background(.ultraThickMaterial)
                .clipShape(Circle())
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        LocationPinView()
    }
}
