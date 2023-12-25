//
//  ReservationView.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 14.12.2023.
//

import SwiftUI

struct ReservationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var closeViews:Bool
    
    @State var nextPage = false
    
    @ObservedObject var vm = ReservationViewModel()
    
    @State var allNotOk = false
    @State var alert = false
    
    var body: some View {
        
        VStack{
            ZStack{
                Text("Бронирование")
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
                HotelBlockCell(horating: vm.reservation?.horating ?? 0, ratingName: vm.reservation?.ratingName ?? "", hotelName: vm.reservation?.hotelName ?? "", hotelAdress: vm.reservation?.hotelAdress ?? "")
                
                ResInfBlockCell(departure: vm.reservation?.departure ?? "", arrivalCountry: vm.reservation?.arrivalCountry ?? "", tourDateStart: vm.reservation?.tourDateStart ?? "", tourDateStop: vm.reservation?.tourDateStop ?? "", numberOfNights: vm.reservation?.numberOfNights ?? 0, hotelName: vm.reservation?.hotelName ?? "", room: vm.reservation?.room ?? "", nutrition: vm.reservation?.nutrition ?? "")

                BuyerInformationCell(phoneNumber: $vm.phone, eMail: $vm.eMail, validEmail: vm.isValidEmail, validPhone: vm.isValidPhone)
                
                VStack{
                    ForEach($vm.tourists){ tourist in
                        TouristCell(tourist: tourist, notRedField: allNotOk)
                    }
                }
                
                HStack{
                    Text("Добавить туриста")
                        .font(.system(size: 18, weight: .bold))
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        vm.addNewTourist()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 6))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 15))
                
                FinalPriceBlockCell(tourPrice: vm.reservation?.tourPrice ?? 0, fuelCharge: vm.reservation?.fuelCharge ?? 0, serviceCharge: vm.reservation?.serviceCharge ?? 0)
                
                HStack{
                    Button {
                        if vm.canSubmit && vm.isValidTourists{
                            nextPage.toggle()
                        } else {
                            allNotOk = true
                            alert = true
                        }
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
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 15))
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("HotelBackGr"))
        .preferredColorScheme(.light)
        .onAppear{
            vm.downloadReservation()
        }
        .fullScreenCover(isPresented: $nextPage) {
            FinalView(closeViews: $closeViews)
        }
        .alert("Ошибка", isPresented: $alert) {
        } message: {
            Text("Не все данные на указанных туристов заполнены")
        }


    }
}
