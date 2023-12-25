//
//  HotelInfCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 25.12.2023.
//

import SwiftUI

struct HotelInfCell: View {
    
    var rating: Int
    var ratingName: String
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Image("Star")
                Text("\(rating)")
                Text(ratingName)
            }
            .foregroundStyle(Color("RatingText"))
            .font(.custom("SFProDisplay", size: 16))
            .bold()
            .frame(width: 149, height: 29)
            .background(Color("RatingBg"))
            .clipShape(.rect(cornerRadius: 5))
            Text(name)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.black)
            
            Button {
                //
            } label: {
                Text(adress)
                    .font(.system(size: 14))
                    .foregroundStyle(.blue)
            }
            
            HStack(alignment: .bottom){
                Text("от \(minimalPrice) ₽")
                    .foregroundStyle(.black)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.trailing, 10)
                Text(priceForIt)
                    .textCase(.lowercase)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            .padding(.bottom)
            
        }
        .padding(.horizontal)
    }
}
