//
//  AddNewPinMapView.swift
//  Swifties
//
//  Created by Fabio Franzese on 11/03/24.
//

import SwiftUI
import MapKit
import PhotosUI

struct AddNewPinMapView: View {
    var myData = sharedData
    
    @Environment(\.dismiss) var dismiss
    @State var pin : Pin
    
    @State private var date : Date = Date.now
    
    @State private var name = ""
    @State private var notes = ""
    
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Insert pin name", text: $name).foregroundColor(Color.accentColor)
                } header: {
                    Text("Name")
                }
                Section {
                    TextField("Insert pin notes", text: $notes).foregroundColor(Color.accentColor)
                } header: {
                    Text("Notes")
                }
                Section {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                } header: {
                    Text("Date")
                }
                
            }
            .navigationTitle(Text("New pin"))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    Button(action: {
                        pin.name = name;
                        pin.date = date;
                        pin.notes = notes;
                        pin.images = []
                        myData.pins.append(pin);
                        dismiss()
                    }){
                        Text("Add")
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewPinMapView(pin: Pin(coordinate: CLLocationCoordinate2D(latitude: 40.8847, longitude: 14.2892)))
}
