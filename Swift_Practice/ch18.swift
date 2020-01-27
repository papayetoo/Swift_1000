//
//  ch18.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/27.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

class Person{
    var name : String = ""
    var age : Int = 0 {
        didSet{
            print("Person age : \(self.age)")
        }
    }
    var koreanAge : Int{
        return self.age + 1
    }
    var fullName : String{
        get {
            return self.name
        }
        
        set{
            self.name = newValue
        }
    }
    
    var introduction : String{
        return "이름 : \(name), 나이 : \(age)"
    }
    
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    
    init?(name: String, age: Int){
        
        if name.isEmpty{
            return nil
        }
        self.name = name
        self.age = age
    }
    
    init?(age: Int){
        if age < 0 {
            return nil
        }
        self.name = "Unknown"
        self.age = age
    }
    
//    지정 이니셜라이져
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
    
//    편의 이니셜라이져
//    편의 이니셜라이져는 반드시 지정 이니셜라이져를 호출해야함.
//    convenience init(name: String){
//        self.init(name : name, age: 0)
//    }
//
    func speak(){
        print("가나다라마바사")
    }
    
    class func introduceClass()->String{
        return "인류의 소원은 평화입니다."
    }
}

class Student : Person{
    var grade : String = "F"
    var major : String
    func study(){
        print("Studying hard")
    }
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var age: Int{
        didSet{
            print("Student age : \(self.age)")
        }
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set{
            self.age = newValue - 1
        }
        
//        didSet{}
//        오류발생 getter 와 같이 정의 불가능
    }
    
    override var fullName: String {
        didSet{
            print("Full Name : \(self.fullName)")
        }
    }
    
//    override init(name: String, age: Int){
//        self.major = "Swift"
//        super.init(name: name, age: age)
//    }
//
//    convenience init(name: String){
//        self.init(name: name, age: 7)
//    }
    
    override init?(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    override init(age: Int){
        self.major = "Swift"
        super.init()
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }

}

class UniversityStudent: Student{
    
    class func introduceClass(){
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+ 입니다."
    }
    
    override func speak() {
        super.speak()
        print("대학생이죠.")
    }
}

func ClassEx()-> Void{
    guard let yagom : Person = Person(name: "yagom", age: 29) else { return
    }
//    yagom.koreanAge = 56 오류 발생 set 함수 없기 때문에.
    yagom.fullName = "Jo yagom"
//    print(yagom.introduction)
    print(yagom.koreanAge)
//    yagom.speak()
    
    guard let jay : Student = Student(name: "jay", age: 14) else { return
    }
    jay.grade = "A"
    jay.koreanAge = 15
    jay.fullName = "Kim jay"
//    print(jay.introduction)
    print(jay.koreanAge)
    
//    let jenny: UniversityStudent = UniversityStudent()
//    jenny.major = "Art"
//    jenny.speak()
//    jenny.study()
    
    print(Person.introduceClass())
    print(Student.introduceClass())
    print(UniversityStudent.introduceClass() as String)
    UniversityStudent.introduceClass() as Void
}
