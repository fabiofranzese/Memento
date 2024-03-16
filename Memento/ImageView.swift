//
//  ImageView.swift
//  Swifties
//
//  Created by Fabio Franzese on 13/03/24.
//

import SwiftUI
import PhotosUI

struct ImageView: View {
    @State var isModalShowed: Bool = false
    
    var body: some View {
        Button(action: {
            isModalShowed.toggle()
        }){
            Text("Images")
                .foregroundColor(.white)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .background(.red)
                .cornerRadius(13.0)
        }.sheet(isPresented: $isModalShowed) {
            ImageModalView(images: [])
        }
    }
}


#Preview {
    ImageView()
}
