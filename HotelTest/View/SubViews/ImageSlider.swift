//
//  ImageSlider.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 22.12.2023.
//

import SwiftUI

struct ImageSlider: View {
    
    var images: [String]
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(images, id: \.self){ image in
                    AsyncImage(url:URL(string: image)){ image in
                        image
                            .resizable()
                            .frame(height: 257)
                            .frame(maxWidth: screen.width * 0.9)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .clipShape(.rect(cornerRadius: 15))
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.horizontal, 10)
                    .containerRelativeFrame(.horizontal, count: 1,spacing: 20)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned )
        .scrollIndicators(.never)
    }
}

