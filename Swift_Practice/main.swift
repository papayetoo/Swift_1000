//
//  main.swift
//  Swift_1000
//
//  Created by 최광현 on 2019/12/20.
//  Copyright © 2019 최광현. All rights reserved.
//

import Foundation


//var levelClassInstance : LevelClass = LevelClass()
//levelClassInstance.levelUp()
//// Level 1
//levelClassInstance.levelDown()
//// Level 0
//levelClassInstance.levelDown()
//// Level -1
//// Reset!
//// Level 0
//levelClassInstance.jumpLevel(to: 3)

//var toggle : OnOffSwitch = OnOffSwitch.off
//toggle.nextState()
//print(toggle)
//
//
//AClass.staticTypeMethod()
//AClass.classTypeMethod()
//BClass.classTypeMethod()

SystemVolume.volume = 10
let myNavi : Navigation =  Navigation()

myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)
