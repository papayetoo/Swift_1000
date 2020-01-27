//
//  ch19.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/27.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

class Coffee{
    let name: String
    let shot: Int
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee{
    var flavor : String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int){
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee{
    let iced : Bool
    
    override var description: String{
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

func chapter19() -> Void{
    let coffee : Coffee = Coffee(shot: 1)
//    print(coffee.description)
    
    let americano : Americano = Americano(shot: 2, iced: false)
//    print(americano.description)
    
    let latte : Latte = Latte(flavor: "green tea", shot: 3)
//    print(latte.description)
    
    let actingConstant: Coffee = Latte(flavor: "Vanila", shot: 2)
//    print(actingConstant.description)
    
    if let actingOne : Americano = coffee as? Americano{
        // coffee 가 Americano 타입의 인스턴스라면
        print("This is americano")
    }else{
        // coffee 가 Americano 타입의 인스턴스가 아니라면.
        print(coffee.description)
    }
    
    if let actingOne : Latte = coffee as? Latte{
        // coffee 가 Latte 타입의 인스턴스라면...
        print("This is Latte")
    }else{
        // coffee 가 Latte 타입의 인스턴스가 아니라면...
        print(coffee.description)
    }
    
    if let actingOne : Coffee = coffee as? Coffee{
        print("This is Coffee")
    }else{
        print(coffee.description)
    }

    let castedCoffee : Coffee = coffee as! Coffee
}
