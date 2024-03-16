//
//  NotesView.swift
//  Swifties
//
//  Created by Fabio Franzese on 13/03/24.
//

import SwiftUI
import MapKit

struct NotesView: View {
    var myData = sharedData
    @State var pin : Pin
    
    
    var body: some View {
        TextEditor(text: $pin.notes).foregroundColor(Color.accentColor).frame(width: 100, height: 30)
    }
}

#Preview {
    NotesView(pin: Pin(coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141), name: "Tower of London", date: Date.now, notes: "Ciao"))
}
