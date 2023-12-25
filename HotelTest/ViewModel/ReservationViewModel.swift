//
//  ReservationViewModel.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 14.12.2023.
//

import Foundation

import SwiftUI
import Combine

class ReservationViewModel: ObservableObject{
    
    @Published var reservation: Reservation?
    @Published var tourists: [TouristModel] = [TouristModel(touristCount: 0, name: "Ivan", surname: "Ivanov", birthDate: "", nation: "", pasportNumber: "", pasportTerm: "")]
    @Published var eMail = ""
    @Published var phone = ""
    @Published var canSubmit = false
    @Published var isValidEmail = false
    @Published var emailIsRed = false
    @Published var isValidPhone = false
    @Published var phoneIsRed = false
    @Published var isValidTourists = false
    private let eMailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let phonePredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)
    var cancelables = Set<AnyCancellable>()
    
    init(){
        phoneAndMailCheck()
        canBuy()
        touristsCheck()
    }
    
    func touristsCheck(){
        $tourists
            .map{ value -> Bool in
                var valid = false
                for val in value{
                    if val.touristIsValid == true {
                        valid = true
                    } else {
                        valid = false
                    }
                }
                return valid
            }
            .sink {[weak self] tourist in
                self?.isValidTourists = tourist
            }
            .store(in: &cancelables)
    }
    
    func phoneAndMailCheck(){
        $phone
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map{ value -> Bool in
                if self.phonePredicate.evaluate(with: value) || value.isEmpty{
                    return false
                } else {
                    return true
                }
            }
            .sink {[weak self] phone in
                self?.isValidPhone = phone
            }
            .store(in: &cancelables)
        
        $eMail
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map{ value -> Bool in
                if self.eMailPredicate.evaluate(with: value) || value.isEmpty{
                    return false
                } else {
                    return true
                }
            }
            .sink {[weak self] email in
                self?.isValidEmail = email
            }
            .store(in: &cancelables)
    }
    
    func canBuy(){
        Publishers.CombineLatest($eMail, $phone)
            .map{ email, phone in
                if self.phonePredicate.evaluate(with: phone) && self.eMailPredicate.evaluate(with: email){
                    return true
                } else {
                    return false
                }
            }
            .sink(receiveValue: { value in
                self.canSubmit = value
            })
            .store(in: &cancelables)
    }
    
    
    func downloadReservation(){
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else {return}
        
        NetworkService.download(url: url)
            .decode(type: Reservation.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [weak self] returnedValue in
                self?.reservation = returnedValue
            })
            .store(in: &cancelables)
    }
    
    func addNewTourist(){
        let count = tourists.count
        tourists.append(TouristModel(touristCount: count, name: "", surname: "", birthDate: "", nation: "", pasportNumber: "", pasportTerm: ""))
    }
}






