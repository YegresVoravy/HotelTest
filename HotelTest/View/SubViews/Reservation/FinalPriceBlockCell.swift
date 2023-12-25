//
//  FinalPriceBlock.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 25.12.2023.
//

import SwiftUI

struct FinalPriceBlockCell: View {
    
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int
    
    var body: some View {
        VStack{
            SumCell(text: "Тур", sum: tourPrice, isBlack: true)
            SumCell(text: "Топливный сбор", sum: fuelCharge, isBlack: true)
            SumCell(text: "Сервисный сбор", sum: serviceCharge, isBlack: true)
            SumCell(text: "К оплате", sum: (tourPrice + fuelCharge + serviceCharge), isBlack: false)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
