//
//  Pin.swift
//  Swifties
//
//  Created by Fabio Franzese on 06/03/24.
//
import SwiftUI
import Foundation
import MapKit
import PhotosUI

struct Pin: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var name : String = "newpin"
    var date: Date = Date.now
    var notes : String = ""
    var images : [String] = []
    var tickets: [String] = []
}
