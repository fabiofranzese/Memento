//
//  PinDetailView.swift
//  Swifties
//
//  Created by Fabio Franzese on 07/03/24.
//

import SwiftUI
import PhotosUI
import Foundation


struct PinDetailView: View {
    let dateFormatter = DateFormatter()
    @State var isModalShowed: Bool = false
    
    @State var pin : Pin
    
    @State var notes : String = ""

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(pin.date.addingTimeInterval(600), style: .date).foregroundColor(Color.accentColor)
                } header: {Text("Date")}
                Section{
                    TextEditor(text: $pin.notes).foregroundColor(Color.accentColor).frame(minHeight: 100)
                } header: {
                    Text("Notes")
                }
                Section{
                   
                    PhotoView(images : pin.images).padding(.top, -3)
                        .padding(.bottom, 10)
                        /*  Button(action: {
                            isModalShowed.toggle()
                        }){
                            Text("Images")
                                .foregroundColor(.white)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 10)
                                .background(.red)
                                .cornerRadius(13.0)
                        }*/

                } header: {
                    Text("Images")
                }
                Section{
                    TicketsView(tickets : pin.tickets).padding(.top, -3)
                        .padding(.bottom, 10)
                } header: {
                    Text("Tickets")
                }
                
            }.navigationTitle(pin.name)
        }
    }
    }


#Preview {
    PinDetailView(pin: Pin(coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141), name: "Tower of London"))
}


