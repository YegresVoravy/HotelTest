//
//  CustomTExtField.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 23.12.2023.
//

import SwiftUI

struct CustomTExtField: View {
    
    var title: String
    var text: Binding<String>
    var isValid: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextField("", text: text)
                .padding(10)
                .padding(.top, 10)
                .background(!isValid ? Color("TextField") : Color("RedTextfield"))
                .clipShape(.rect(cornerRadius: 10))
            Text(title)
                .font(.system(size: 10))
                .foregroundStyle(.gray)
                .padding(.top, 8)
                .padding(.leading, 10)
        }
    }
}
