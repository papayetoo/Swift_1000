//
//  TypeMethod.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/09.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

class AClass{
    static func staticTypeMethod(){
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod(){
        print("AClass classTypeMethod")
    }
}

class BClass: AClass{
//
//    오류 발생 !! 재정의 불가!
//    override static func staticTypeMethod(){
//
//    }
    
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}


struct SystemVolume{
    //    타입 프로퍼티를 사용하면 언제나 유일한 값이 됨.
    static var volume : Int = 5
    
    //    타입 프로퍼티를 제어하기 위해 타입 메서드를 사용함
    static func mute(){
        self.volume = 0
    }
}

class Navigation{
    //    네비게이션 인스턴스마다 음량을 따로 설정할 수 있습니다.
    var volume : Int = 5
    
    //    길 안내 음성 재생
    func guideWay(){
    //    네비게이션 외 다른 재생원 음소거
        SystemVolume.mute()
    }
    
    func finishGuideWay(){
    //    기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

