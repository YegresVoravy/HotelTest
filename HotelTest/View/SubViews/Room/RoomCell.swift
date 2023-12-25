//
//  RoomCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 18.12.2023.
//

import SwiftUI

struct RoomCell: View {
    
    @Binding var closeViews: Bool
    @State var room: Room
    @State private var nextPage = false
    
    var body: some View {
        VStack{
            ImageSlider(images: room.imageUrls)
            VStack(alignment: .leading){
                Text(room.name)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                HStack(alignment: .top){
                    ForEach(room.peculiarities, id: \.self){ pecul in
                        Text(pecul)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.gray)
                            .padding(.trailing, 10)
                    }
                }
                Button {
                    //
                } label: {
                    HStack{
                        Text("Подробнее о номере")
                            .padding(.horizontal)
                        
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.blue)
                    .padding(8)
                    .background(Color("RoomCellBgButton"))
                    .clipShape(.rect(cornerRadius: 5))
                }
                HStack(alignment: .bottom){
                    Text("от \(room.price) ₽")
                        .foregroundStyle(.black)
                        .font(.custom("SFProDisplay", size: 30))
                        .bold()
                        .padding(.trailing, 10)
                    Text(room.pricePer)
                        .textCase(.lowercase)
                        .font(.custom("san-francisco", size: 14))
                        .foregroundStyle(.gray)
                }
                Button {
                    nextPage.toggle()
                } label: {
                    Text("Выбрать номер")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(.rect(cornerRadius: 15))
                }
            }
            .padding()
        }
        .padding(.top, 10)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
        .fullScreenCover(isPresented: $nextPage) {
            ReservationView(closeViews: $closeViews)
        }
    }
}
