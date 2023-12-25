//
//  HotelBlock.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 25.12.2023.
//

import SwiftUI

struct HotelBlockCell: View {
    
    var horating: Int
    var ratingName: String
    var hotelName: String
    var hotelAdress: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                HStack{
                    Image("Star")
                    Text("\(horating)")
                    Text("\(ratingName)")
                }
                Spacer()
            }
            .foregroundStyle(Color("RatingText"))
            .font(.custom("SFProDisplay", size: 16))
            .bold()
            .frame(width: 149, height: 29)
            .background(Color("RatingBg"))
            .clipShape(.rect(cornerRadius: 5))
            .padding(.bottom, 10)
            
            Text(hotelName)
                .font(.system(size: 22, weight: .bold))
                .padding(.bottom, 10)
            
            Button {
                //
            } label: {
                Text(hotelAdress)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
