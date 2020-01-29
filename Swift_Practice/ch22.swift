//
//  ch22.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/29.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation
// 제네릭(Generic) 구현

prefix operator **
postfix operator **

//제네릭 사용하여 전위연산자 구현
prefix func ** <T : BinaryInteger> (value: T) -> T {
    return value * value
}

//제네릭 사용하여 후위연산자 구현
postfix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

struct Stack <Element> : Container {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeFirst()
    }
    func printStack() -> Void {
        print(items, separator: " ", terminator: "\n")
    }
    
    // Container 프로토콜 준수를 위한 구현
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Stack{
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType] where Indices.Iterator.Element == Int{
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

protocol Container {
    associatedtype ItemType
    var count : Int { get }
    mutating func append(_ item: ItemType)
    subscript(i:Int) -> ItemType { get }
}

class myContainer: Container {
    var items : Array<Int> = Array<Int>()
    
    var count : Int {
        return items.count
    }
    
    func append(_ item: myContainer.ItemType) {
        items.append(item)
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct IntStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int{
        return items.removeFirst()
    }
    
    //Container 프로토콜 준수를 위한 구현.
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count : Int {
        return self.items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}


func ch22()-> Void{
    var integerStack : Stack<Int> = Stack<Int>()
    for i in 1...5 {
        integerStack.append(i)
    }
    
    print(integerStack[0...4])
}
