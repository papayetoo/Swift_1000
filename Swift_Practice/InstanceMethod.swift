//
//  InstanceMethod.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/09.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation


class LevelClass{
    var level : Int = 0{
//       프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자.
        didSet{
            print("Level \(level)")
        }
    }
//    레벨이 올랐을 때 호출할 메서드
    func levelUp(){
        print("Level up")
        level += 1
    }
//    레벨이 감소했을 때 호출할 메서드
    func levelDown(){
        print("Level Down")
        level -= 1
        if level < 0{
            reset()
//            self = LevelClass()
//            self는 변경할 수 없다는 오류 발생.
        }
    }
//    특정 레벨로 이동할 때 호출할 메서드
    func jumpLevel(to level: Int){
        print("Jump to \(level)")
    //  자기 자신을 가르키는 self 프로퍼티 사용.
        self.level = level
    }
//    레벨을 초기화 할 때 호출할 메서드
    func reset(){
        print("Reset")
        level = 0
    }
}

struct LevelStuct{
    // 구조체나 열겨헝 등은 값 타입이므로 메서드 앞에 mutating 키워드를 붙여서
    // 해당 메서드가 인스턴스 내부의 값을 변경하는 것을 명명해야 한다.
    var level : Int = 0{
    //  프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자.
            didSet{
                print("Level \(level)")
            }
    }
    //    레벨이 올랐을 때 호출할 메서드
    mutating func levelUp(){
        print("Level up")
        level += 1
    }
    //    레벨이 감소했을 때 호출할 메서드
    mutating func levelDown(){
        print("Level Down")
        level -= 1
        if level < 0{
            reset()
        }
    }
    //    특정 레벨로 이동할 때 호출할 메서드
    mutating func jumpLevel(to: Int){
        print("Jump to \(to)")
        level = to
    }
    //    레벨을 초기화 할 때 호출할 메서드
    mutating func reset(){
        print("Reset")
        level = 0
//        self = LevelStuct()
//        구조체에서는 self의 변경이 가능하다.
    }
}

enum OnOffSwitch{
    case on, off
    mutating func nextState(){
        self = self == .on ? .off : .on
    }
}
