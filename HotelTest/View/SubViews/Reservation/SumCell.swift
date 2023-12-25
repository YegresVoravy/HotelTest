//
//  SumCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 20.12.2023.
//

import SwiftUI

struct SumCell: View {
    
    var text: String
    var sum: Int
    var isBlack = true
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                    Text(text)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                Spacer()
                        Text("\(sum) ₽")
                            .font(.system(size: 16))
                            .foregroundStyle(isBlack ? .black : .blue)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 3)
        }
    }
}
