//
//  ch20.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/29.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

protocol Sendable{
    var from : Sendable {get}
    var to: Receivable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

protocol Receivable{
    func received(data: Any, from: Sendable)
}

class Message: Sendable, Receivable {
    var from: Sendable{
        return self
    }
    
    var to: Receivable?
    
    //메시지를 발신합니다.
    func send(data: Any) {
        guard let receiver: Receivable =  self.to else{
            print("Message has no receiver")
            return
        }
        //수신 간능한 인스턴스의 received 메서드를 호출합니다.
        receiver.received(data: data, from: self.from)
    }
    
    //메시지를 수신합니다.
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    
    //class 메서드이므로 상속이 가능합니다.
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receivable{
    var from: Sendable{
        return self
    }
    
    var to: Receivable?
    
    func send(data: Any) {
        guard let receiver: Receivable = self.to else{
            print("Mail has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    
    // static 메서드 이므로 상속이 불가능합니다.
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable{
            return sendableInstance.to != nil
        }
        return false
    }
}

func ch20(){
    // 두 Message 인스턴스를 생성합니다.
    let myPhoneMessage: Message = Message()
    let yourPhoneMessage: Message = Message()
    
    // 아직 수신받을 인스턴스가 없습니다.
    myPhoneMessage.send(data: "Hello")
    
    // Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있습니다.
    myPhoneMessage.to = yourPhoneMessage
    myPhoneMessage.send(data: "Hello")
    
    // 두 Mail 인스턴스를 생성합니다.
    let myMail : Mail = Mail()
    let yourMail: Mail = Mail()
    
    myMail.send(data: "Hi") //Mail has no receiver
    
    // Mail 과 Message 모두 Sendable과 Receivable 프로토콜을 준수하므로
    // 서로 주고받을 수 있습니다.
    myMail.to = yourMail
    myMail.send(data: "Hi") // Mail received Hi from Mail
    
    myMail.to = myPhoneMessage
    myMail.send(data: "Bye") // Message received Bye from Mail
    
    // String은 Sendable 프로토콜을 준수하지 않았습니다.
    Message.isSendableInstance("Hello") // false
    
    // Mail과 Message는 Sendable 프로토콜을 준수합니다.
    Message.isSendableInstance(myPhoneMessage) //true
    
    //yourPhoneMessage는 to 프로퍼티가 설정되지 않아서 보낼 수 없는 상태입니다.
    Message.isSendableInstance(yourPhoneMessage) // false
    Mail.isSendableInstance(myPhoneMessage) // true
    Mail.isSendableInstance(myMail) // true
    
    var someSendable: Sendable = myMail
    someSendable.send(data: "Hello")
}
