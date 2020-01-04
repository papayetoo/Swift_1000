//
//  main.swift
//  Swift_1000
//
//  Created by 최광현 on 2019/12/20.
//  Copyright © 2019 최광현. All rights reserved.
//

import Foundation

struct CoordinatePoint{
    var x : Int
    var y : Int
    
    func oppositePoint() -> Self{
        return CoordinatePoint(x: -x, y: -y)
    }
    
    mutating func setOppsitePoint(_ opposite: CoordinatePoint){
        x = -opposite.x;
        y = -opposite.y;
    }
}

var yagomPosition : CoordinatePoint = CoordinatePoint(x: 10, y:20)
print(yagomPosition)

print(yagomPosition.oppositePoint())
