//
//  ch14.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/17.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

class Room{
    //호실
    var number : Int
    init(number: Int) {
        //생성자 또는 초기화
        self.number = number
    }
}

class Building{
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    init(province: String, city:String, street: String, building: Building?, detailAddress: String?) {
        self.province = province
        self.city = city
        self.street = street
        self.building = building
        self.detailAddress = detailAddress
    }
    
//    func fullAddress() -> String?{
//        var restAddress: String? = nil
//
//        if let buildingInfo : Building = self.building {
//
//            restAddress = buildingInfo.name
//
//        }else if let detail = self.detailAddress{
//            restAddress = detail
//        }
//
//        if let rest: String = restAddress{
//            var fullAddress: String =  self.province
//
//            fullAddress += " " + self.city
//            fullAddress += " " + self.street
//            fullAddress += " " + rest
//            return fullAddress
//        } else{
//            return nil
//        }
//    }
    
    func fullAddress() -> String? {
        // gurad 를 활용한 옵셔널 체이닝 개선 버젼.
        var restAddress : String? = nil
        
        if let buildingInfo : Building = self.building {
            restAddress = buildingInfo.name
        }else if let detail = self.detailAddress{
            restAddress = detail
        }
        
        guard let rest : String = restAddress else {
            return nil
        }
        
        var fullAddress : String  = self.province
        fullAddress += " " + self.city
        fullAddress += " " + self.street
        fullAddress += " " + rest
        return fullAddress
        
    }
    
    func printAddress(){
        if let address : String = self.fullAddress(){
            print(address)
        }
    }
}

//class Person{
//    var name: String
//    var address: Address?
//    
//    init(name: String) {
//        self.name = name
//    }
//}
//
//func optionalChaining(){
//    let yagom : Person = Person(name: "yagom")
//    
//    let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number
//    //nil
//    // let yagomRoomViaOptionalUnwrapping: Int = yagom.address!.building!.room!.number
//    // 오류 발생!
//    
//    // OptionalChaining을 쓰지 않고 OptionalBinding을 사용한 경우의 코드
//    var roomNumber : Int? = nil
//    
//    if let yagomAddress: Address =  yagom.address{
//        if  let yagomBuilding : Building = yagomAddress.building{
//            if let yagomRoom: Room = yagomBuilding.room{
//                roomNumber = yagomRoom.number
//            }
//        }
//    }
//    
//    if let number: Int = roomNumber{
//        print(number)
//    }else{
//        print("Can not find room number")
//    }
//    
////    yagom.address?.building?.room?.number = 505
////    print(yagom.address?.building?.room?.number)
////    yagom의 address 프로퍼티가 없고, 그 하위 building와 room 프로퍼티도 없기 때문에 옵셔널체이닝 중단됨.
////    아래의 방법으로 해야만 올바르게 동작한다.
//    
//    yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
//    yagom.address?.building = Building(name: "곰굴")
//    yagom.address?.building?.room = Room(number: 0)
//    yagom.address?.building?.room?.number = 505
//    
//    print(yagom.address?.building?.room?.number)
//    
//    // 옵셔널 체이닝을 활용한 함수 호출.
//    yagom.address?.fullAddress()?.isEmpty
//    yagom.address?.printAddress()
//}
//
//func greet(_ person : [String: String]){
//    guard let name : String = person["name"] else {
//        return
//    }
//    
//    print("Hello \(name)!")
//    
//    guard let location: String = person["location"] else {
//        print("I hope the weather is nice near you")
//        return
//    }
//    
//    print("I hope the weather is nice in \(location)")
//}
//
//func earlyExit(){
//    var personInfo : [String : String] = [String : String]()
//    personInfo["name"] = "Jenny"
//    
//    greet(personInfo)
//    
//    personInfo["location"] = "Korea"
//    greet(personInfo)
//}
//
