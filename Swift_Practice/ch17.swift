//
//  Subscript.swift
//  Swift_Practice
//
//  Created by 최광현 on 2020/01/17.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

//struct Student{
//    var name : String
//    var number : Int
//}
//
//class School{
//
//    var number : Int = 0
//    var students : [Student] = [Student]()
//
//    func addStudent(name: String){
//        let student: Student = Student(name: name, number: self.number)
//        self.students.append(student)
//        self.number += 1
//    }
//
//    func addStudents(names: String...){
//        for name in names{
//            self.addStudent(name: name)
//        }
//    }
//
//    subscript(index: Int) -> Student? {
//        // 첫 번째 스크립트
//        get{
//            if index < self.number{
//                //Students의 배열 수 범위 내이면 해당 인덱스에 해당하는 배열을 리턴.
//                return self.students[index]
//            }
//            return nil
//        }
//
//        set{
//            guard var newStudent : Student = newValue else{
//                // newValue : Student가 존재하지 않는 다면..
//                // return
//                return
//            }
//
//            var number : Int = index
//            // School[index] 에서 index 값을 number에 저장.
//
//            if index > self.number {
//                //index가 배열 크기 보다 크다면
//                //배열 크기를 하나 증가시킴.
//                number = self.number
//                self.number += 1
//            }
//
//            newStudent.number = number
//            self.students[number] = newStudent
//        }
//    }
//
//    subscript(name: String) -> Int?{
//
//        get{
//            return self.students.filter({$0.name == name}).first?.number
//        }
//
//        set{
//            // 적절한 설정자 역할 수행.
//            // set(newValue) 또는 set 모두 가능.
//            guard var number: Int = newValue else{
//                return
//            }
//
//            if number > self.number{
//                number = self.number
//                self.number += 1
//            }
//
//            let newStudent : Student = Student(name: name, number: number)
//            self.students[number] = newStudent
//        }
//    }
//
//    subscript(name: String, number: Int) -> Student? {
//        // 세 번째 스크립트
//        return self.students.filter({$0.name == name && $0.number == number}).first
//    }
//}

enum School: Int{
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School?{
        return Self(rawValue: level)
        //  return School(rawValue: level)과 같은 표현
    }
}
