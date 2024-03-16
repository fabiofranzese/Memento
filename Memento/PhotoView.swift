//
//  PhotoView.swift
//  Swifties
//
//  Created by Fabio Franzese on 13/03/24.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    var images : [String]
    @State private var selectedItems = [PhotosPickerItem]()
        @State private var selectedImages = [Image]()

        var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(images, id: \.self) {
                            image in Image(image).resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20.0)
                                .frame(width: 300, height: 300)
                        }
                        
                        ForEach(0..<selectedImages.count, id: \.self) { i in
                            selectedImages[i]
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20.0)
                                .frame(width: 300, height: 300)
                               
                        }
                    }
                }
                Button(action: {
                  
                }){
           
                    
                    PhotosPicker("Select images", selection: $selectedItems, matching: .images)
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
    PhotoView(images: ["Piazza del Plebiscito"])
}
