//
//  RoomView.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 17.12.2023.
//

import SwiftUI

struct RoomView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var closeViews: Bool
    
    @State var rooms: [Room]
    @State var hotelName: String
    
    
    var body: some View {
        VStack{
            ZStack{
                Text(hotelName)
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

            
            ScrollView{
                ForEach(rooms) { room in
                    RoomCell(closeViews: $closeViews, room: room)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("HotelBackGr"))
        .preferredColorScheme(.light)
    }
}
