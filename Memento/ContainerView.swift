//
//  ContainerView.swift
//  Swifties
//
//  Created by Fabio Franzese on 06/03/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView {
                    MapView()
                        .tabItem {
                            Label("Map",
                                  systemImage: "map.fill")
                        }

                    PinListView()
                            .tabItem {
                                Label("My pins",
                                      systemImage: "mappin.circle.fill")
                            }
                    }
    }
}

#Preview {
    ContainerView()
}
