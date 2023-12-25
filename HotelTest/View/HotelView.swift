//
//  HotelView.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 14.12.2023.
//

import SwiftUI

struct HotelView: View {
    
    @ObservedObject var vm = HotelViewModel()
    @State private var nextPage = false
    
    
    
    @State var startingOffsetX: CGFloat = 0
    @State var currentDragOffsetX: CGFloat = 0
    
    
    var body: some View {
        
        ScrollView {
            
            
            VStack{
                
                Text("Отель")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.top)
                
                ImageSlider(images: vm.hotel?.imageUrls ?? [])
                
                HotelInfCell(rating: vm.hotel?.rating ?? 0, ratingName: vm.hotel?.ratingName ?? "", name: vm.hotel?.name ?? "", adress: vm.hotel?.adress ?? "", minimalPrice: vm.hotel?.minimalPrice ?? 0, priceForIt: vm.hotel?.priceForIt ?? "")
                
            }
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 15))
            .padding(.bottom, 5)
            
            AboutHotelCell(firstPeculiarities: vm.hotel?.aboutTheHotel.peculiarities[0] ?? "", secondPeculiarities: vm.hotel?.aboutTheHotel.peculiarities[2] ?? "", thirdPeculiarities: vm.hotel?.aboutTheHotel.peculiarities[1] ?? "", fourthPeculiarities: vm.hotel?.aboutTheHotel.peculiarities[3] ?? "", description: vm.hotel?.aboutTheHotel.description ?? "")
            
            HStack{
                Button {
                    nextPage.toggle()
                } label: {
                    Text("К выбору номера")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(.rect(cornerRadius: 15))
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 15))
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("HotelBackGr"))
        .preferredColorScheme(.light)
        .onAppear{
            vm.downloadHotel()
            vm.downloadRooms()
        }
        .fullScreenCover(isPresented: $nextPage) {
            RoomView(closeViews: $nextPage, rooms: vm.rooms, hotelName: vm.hotel?.name ?? "")
        }
    }
}

