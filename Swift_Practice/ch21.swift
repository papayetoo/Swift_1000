//
//  ch21.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/29.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

extension Int{
    // 익스텐션을 통한 연산 프로퍼티 추가
    var isEven: Bool{
        return self % 2 == 0
    }
    
    var isOdd: Bool{
        return self % 2 == 1
    }
    
    func multiply(by n: Int) -> Int{
        return self * n
    }
    
    mutating func multiplySelf(by n: Int){
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
    
    //익스텐션을 통한 중첩 데이터 타입 추가
    enum Kind{
        case negative, zero, positive
    }
    
    var kind: Kind{
        switch self{
        case 0 :
            return .zero
        case let x where x > 0:
            return .positive
        default :
            return .negative
        }
    }
}

extension String{
    subscript(appedValue: String) -> String{
        return self + appedValue
    }
    
    subscript(repeatCount: UInt) -> String{
        var str: String = ""
        
        for _ in 0..<repeatCount {
            str += self
        }
        
        return str
    }
}

func printIntegerKinds(numbers: [Int]){
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

func ch21(){
   printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])
}
