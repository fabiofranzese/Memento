//
//  PinListView.swift
//  Swifties
//
//  Created by Fabio Franzese on 06/03/24.
//

import SwiftUI
import AVFoundation

struct PinListView: View {
    var myData = sharedData
    @State private var searchText = ""
    
    var searchResults : [Pin] {
        if searchText.isEmpty {
            return myData.pins
        } else {
            return myData.pins.filter { $0.name.contains(searchText) }
        }
    }

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) {pin in
                    NavigationLink(destination: PinDetailView(pin : pin)) {
                        HStack {
                            Image(systemName:"mappin.circle.fill")
                                .foregroundColor(Color("AccentColor"))
                            Text(pin.name)
                            
                        }
                    }
                }
            }.navigationTitle("My pins")
        }.searchable(text: $searchText, prompt: "Search pins")
    }
}


#Preview {
    PinListView()
}
