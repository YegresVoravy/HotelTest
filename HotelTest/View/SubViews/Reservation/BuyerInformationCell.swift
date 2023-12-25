//
//  BuyerInformationCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 20.12.2023.
//

import SwiftUI

struct BuyerInformationCell: View {
    
    @Binding var phoneNumber: String
    @Binding var eMail: String
    var validEmail: Bool
    var validPhone: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Информация о покупателе")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
            CustomTExtField(title: "Номер телефона", text: $phoneNumber, isValid: validPhone)
                .onChange(of: phoneNumber) {
                    DispatchQueue.main.async {
                        phoneNumber = phoneNumber.formatedMask(text: phoneNumber, mask: "+X(XXX)XXX-XX-XX")
                    }
                }
            CustomTExtField(title: "Почта", text: $eMail, isValid: validEmail)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
