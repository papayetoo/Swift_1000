//
//  Closure.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/14.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

var names : [String] = ["wizplan", "eric", "yagom", "jenny"]
func backwards(first: String, second: String) -> Bool{
    print("\(first) \(second) 비교중")
    return first > second
}

//Closure 문법 및 간략화하는 방법에 대하여.
//let reversed: [String] = names.sorted(by:backwards)
//let reversed: [String] = names.sorted(by: {(first:String, second:String)->Bool in return first > second})
//let reversed: [String] = names.sorted {(first, second) in return first > second}
//4번째 단축인자 이름 사용 $n(0...) 첫 번째 전달인자부터 간단히 사용.
//let reversed : [String] = names.sorted{
//    return $0 > $1;
//}
//5번째 암시전 반환표현 사용
//let reversed : [String] = names.sorted{ $0  > $1}
//6번재 스위프트 라이브러리에서 정의된 연산자 >의 사용.
//let reversed : [String] = names.sorted(by: >)

