//
//  main.swift
//  Swift_1000
//
//  Created by 최광현 on 2019/12/20.
//  Copyright © 2019 최광현. All rights reserved.
//

import Foundation

class Person {
    var height : Float = 0.0
    var weight : Float = 0.0
}

var yagom : Person = Person()
var friend : Person = yagom
let anotherFriend : Person = Person()

print(yagom === friend)
print(yagom === anotherFriend)
print(friend !== anotherFriend)
