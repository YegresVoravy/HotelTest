//
//  AboutHotelCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 25.12.2023.
//

import SwiftUI

struct AboutHotelCell: View {
    
    var firstPeculiarities: String
    var secondPeculiarities: String
    var thirdPeculiarities: String
    var fourthPeculiarities: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Об отеле")
                .font(.system(size: 18, weight: .bold))
                .padding(.top)
                .padding(.leading, 16)
            
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Text(firstPeculiarities)
                        .textCase(.lowercase)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Text(secondPeculiarities)
                        .textCase(.lowercase)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
                Spacer()
                    .padding(.leading, 10)
                HStack(alignment: .top){
                    Text(thirdPeculiarities)
                        .textCase(.lowercase)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(fourthPeculiarities)
                        .textCase(.lowercase)
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            .padding(.horizontal, 16)
            
            Text(description)
                .padding(.leading, 16)
            
            VStack{
                Button {
                    //
                } label: {
                    HStack(alignment: .center){
                        Image("emojiHappy")
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                            .padding(.bottom, 12)
                        VStack{
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Удобства")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 16))
                                    Text("Самое необходимое")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 14))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                            }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.gray)
                                .opacity(0.15)
                        }
                    }
                    .padding()
                }
                
                Button {
                    //
                } label: {
                    HStack(alignment: .center){
                        Image("tickSquare")
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                            .padding(.bottom, 12)
                        VStack{
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Что включено")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 16))
                                    Text("Самое необходимое")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 14))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                            }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.gray)
                                .opacity(0.15)
                        }
                    }
                    .padding()
                }
                
                Button {
                    //
                } label: {
                    HStack(alignment: .center){
                        Image("closeSquare")
                            .foregroundStyle(.black)
                            .font(.system(size: 18))
                        VStack{
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Что не включено")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 16))
                                    Text("Самое необходимое")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 14))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding(16)
        }
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
