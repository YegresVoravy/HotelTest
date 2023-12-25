//
//  HotelViewModel.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 14.12.2023.
//

import SwiftUI
import Combine


class HotelViewModel: ObservableObject{
    
    @Published var hotel: Hotel?
    @Published var rooms: [Room] = []
    @Published var hotelImagesCount = 0
    @Published var hotelMainImage: String = ""
    @Published var hotelImages: [String] = []
    @Published var roomImagesCount = 0
    @Published var roomMainImage: String = ""
    @Published var roomImages: [String] = []
    var cancelables = Set<AnyCancellable>()
    
        func downloadHotel(){
            guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {return}
    
            NetworkService.download(url: url)
                .decode(type: Hotel.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { error in
                    print(error)
                }, receiveValue: { [weak self] returnedValue in
                    self?.hotel = returnedValue
                    self?.hotelMainImage = returnedValue.imageUrls.first ?? ""
                    self?.hotelImages = returnedValue.imageUrls
                })
                .store(in: &cancelables)
        }
    
    func downloadRooms(){
        guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else {return}

        NetworkService.download(url: url)
            .decode(type: Rooms.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.rooms = returnedValue.rooms
                self?.roomMainImage = returnedValue.rooms.first?.imageUrls.first ?? ""
                self?.roomImages = returnedValue.rooms.first?.imageUrls ?? [""]
            })
            .store(in: &cancelables)
    }
}
