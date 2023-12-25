//
//  TouristCell.swift
//  HotelTest
//
//  Created by AlkoFitoNiashka on 20.12.2023.
//

import SwiftUI

struct TouristCell: View {
    
    @Binding var tourist: TouristModel
    @State var isVisible = true
    var notRedField: Bool
    @State var touristCount = ["Первый","Второй","Третий","Четвертый","Пятый","Шестой","Седьмой","Восьмой","Девятый","Десятый"]
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text("\(touristCount[tourist.touristCount]) турист")
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    isVisible.toggle()
                } label: {
                    Image(systemName: isVisible ? "chevron.up" : "chevron.down")
                        .foregroundStyle(.blue)
                        .padding(10)
                        .background(Color("RoomCellBgButton"))
                        .clipShape(.rect(cornerRadius: 6))
                }
            }
            if isVisible{
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.name)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.nameIsValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Text("Имя")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.surname)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.surnameIsValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Фамилия")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.birthDate)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.birthDateIsValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Дата рождения")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.nation)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.nationIsValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Гражданство")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.pasportNumber)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.pasportNumberIsValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Номер загранпаспорта")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
                ZStack(alignment: .topLeading){
                    TextField("", text: $tourist.pasportTerm)
                        .padding(10)
                        .padding(.top, 10)
                        .background(notRedField == false || tourist.pasportTermValid ? Color("TextField") : Color("RedTextfield"))
                        .clipShape(.rect(cornerRadius: 10))
                    Text("Срок действия загранпаспорта")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 10)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}
