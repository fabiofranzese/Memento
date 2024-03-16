//
//  ImageModalView.swift//  Swifties
//
//  Created by Fabio Franzese on 13/03/24.
//

import SwiftUI
import PhotosUI

struct ImageModalView: View {
    var images : [Image]
    var body: some View {
        images[1]
        }
    }

#Preview {
    ImageModalView(images : [Image("Piazza del Plebiscito"),Image("piazza del plebiscito1"), Image("capodichino"),Image("capodichino1")])
}
