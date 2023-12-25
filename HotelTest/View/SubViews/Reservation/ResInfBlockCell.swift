//
//  ResInfBlock.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 25.12.2023.
//

import SwiftUI

struct ResInfBlockCell: View {
    
    var departure: String
    var arrivalCountry: String
    var tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var hotelName: String
    var room: String
    var nutrition: String
    
    var body: some View {
        VStack(alignment: .leading){
            
            HotelInformationCell(group: "Вылет из", text: departure)
            HotelInformationCell(group: "Страна, город", text: arrivalCountry)
            HotelInformationCell(group: "Даты", text: tourDateStart, secondaryText: tourDateStop)
            HotelInformationCell(group: "Кол-во ночей", text: String(numberOfNights))
            HotelInformationCell(group: "Отель", text: hotelName)
            HotelInformationCell(group: "Номер", text: room)
            HotelInformationCell(group: "Питание", text: nutrition)
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
