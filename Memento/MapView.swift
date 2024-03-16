//
//  ContentView.swift
//  Swifties
//
//  Created by Fabio Franzese on 05/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var myData = sharedData
    
    
    @State private var showingsheet = false
        
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.8367, longitude: 14.3022),
            span: MKCoordinateSpan(latitudeDelta: 0.11, longitudeDelta: 0.11)
        )
    )
    
    @State private var newpin : Pin = Pin(coordinate: CLLocationCoordinate2D(latitude: 40.836631, longitude: 14.306867))
    
    var body: some View {
        NavigationStack {
            Map(position: $position)
            {
                ForEach(myData.pins) {pin in Annotation(pin.name, coordinate: pin.coordinate) {
                    NavigationLink(destination: PinDetailView(pin: pin)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(.white)
                            Image(systemName: "mappin.square.fill").resizable()
                                .padding(2)
                                .frame(width: 33.0, height: 33.0)
                        }}
                }

                }
            }
                .onMapCameraChange(frequency: .continuous) { context in
                    print(context.region)}
                .mapStyle(.hybrid)
                
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                        Button(action: {
                            newpin.coordinate = CLLocationCoordinate2D(latitude: 40.836631, longitude: 14.306867);
                            showingsheet.toggle()
                        }){
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                                .padding()
                                .background(testColor)
                                .cornerRadius(30)
                                
                        }.sheet(isPresented: $showingsheet){AddNewPinMapView(pin: newpin)}
                    }
                }
        }
    }

}

#Preview {
    MapView()
}
