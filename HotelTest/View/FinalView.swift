//
//  FinalView.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 20.12.2023.
//

import SwiftUI



struct FinalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var closeViews:Bool
    
    var body: some View {
        VStack{
            ZStack{
                Text("Pаказ оплачен")
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.center)
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .padding()
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            .background(Color.white)
            Spacer()
            VStack(alignment: .center){
                Image("Frame610")
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.vertical)
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            Button {
                closeViews.toggle()
            } label: {
                Text("Супер!")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 15))
            }
        }
        .padding()
        .background(Color.white)
    }
}
