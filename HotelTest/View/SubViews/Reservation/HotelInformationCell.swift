//
//  InformationCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 19.12.2023.
//

import SwiftUI

struct HotelInformationCell: View {
    
    var group: String
    var text: String?
    var secondaryText: String?
    
    var body: some View {
        HStack(alignment: .top){
            HStack{
                Text(group)
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.35)
            Spacer()
            HStack{
                Text((secondaryText == nil) ? text ?? "" : "\(text ?? "") - \(secondaryText ?? "")")
                    .font(.system(size: 16))
                    .foregroundStyle(.black)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.55)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 3)
    }
}
