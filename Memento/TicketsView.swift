//
//  TicketsView.swift
//  Swifties
//
//  Created by Fabio Franzese on 13/03/24.
//

import SwiftUI
import PhotosUI

struct TicketsView: View {
    @State var isModalShowed: Bool = false
    var tickets : [String]
    
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(tickets, id: \.self) {
                        image in Image(image).resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20.0)
                            .frame(width: 300, height: 300)
                    }
                }
            }
            Button(action: {
                
            }){
                
                
                PhotosPicker("Select tickets", selection: $selectedItems, matching: .images)
            }   .foregroundColor(.white)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .background(.red)
                .cornerRadius(13.0)
                .onChange(of: selectedItems) {
                    Task {
                        selectedImages.removeAll()
                        
                        for item in selectedItems {
                            if let image = try? await item.loadTransferable(type: Image.self) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
        }
    }
}


#Preview {
    TicketsView(tickets: ["ticket"])
}
