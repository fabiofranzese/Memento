//
//  Data.swift
//  Swifties
//
//  Created by Fabio Franzese on 06/03/24.
//

import SwiftUI
import Observation
import MapKit
import Foundation

@Observable
class SharedData {
        var m = "aa"
        var pins = [
            Pin(coordinate: CLLocationCoordinate2D(latitude: 40.8358, longitude: 14.2486), name: "Piazza del Plebiscito", date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 7)) ?? Date.now, notes: "I had a great time in Piazza del Plebiscito with my friends Giosué and Davide", images:  ["Piazza del Plebiscito", "piazza del plebiscito1"], tickets: ["museum"]),
            Pin(coordinate: CLLocationCoordinate2D(latitude: 40.8847, longitude: 14.2892), name: "Aeroporto di Napoli", date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 3)) ?? Date.now, notes: "I just landed in Naples and I am incredibly excited to visit this amazing city and get to know its secrets", images: ["capodichino", "capodichino1"], tickets: ["ticket"]
               )
            
        ]
    }
var sharedData = SharedData()

