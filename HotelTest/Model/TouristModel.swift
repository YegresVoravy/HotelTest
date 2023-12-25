//
//  TouristModel.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 20.12.2023.
//

import Foundation

struct TouristModel: Codable, Identifiable, Equatable {
    var id = UUID().uuidString
    var touristCount: Int
    var name: String
    
    var nameIsValid: Bool {
        get{
            if name.isEmpty || name == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.nameIsValid = newValue
        }
    }
    var surname: String
    var surnameIsValid: Bool {
        get{
            if surname.isEmpty || surname == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.surnameIsValid = newValue
        }
    }
    var birthDate: String
    var birthDateIsValid: Bool {
        get{
            if birthDate.isEmpty || birthDate == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.birthDateIsValid = newValue
        }
    }
    var nation: String
    var nationIsValid: Bool{
        get{
            if nation.isEmpty || nation == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.nationIsValid = newValue
        }
    }
    var pasportNumber: String
    var pasportNumberIsValid: Bool {
        get{
            if pasportNumber.isEmpty || pasportNumber == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.pasportNumberIsValid = newValue
        }
    }
    var pasportTerm: String
    var pasportTermValid: Bool {
        get{
            if pasportTerm.isEmpty || pasportTerm == ""{
                return false
            } else {
                return true
            }
        }
        set{
            self.pasportTermValid = newValue
        }
    }
    var touristIsValid: Bool {
        if (nameIsValid == true) && (surnameIsValid == true) && (birthDateIsValid == true) && (nationIsValid == true) && (pasportNumberIsValid  == true) && (pasportTermValid  == true) {
            return true
        } else {
            return false
        }
    }
}
