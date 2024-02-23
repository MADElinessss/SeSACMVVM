//
//  User.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

struct User {
    let name: String
    let age: Int
}

class Food {
    
    private var closure: (() -> Void)?// 1. 전체를 옵셔널로 -> 왜,,?
    
    // 인스턴스 프로퍼티
    var name: String { // 중괄호 있지만 연산 프로퍼티는 아니지
        didSet { // 초기화때는 실행X, 값이 바뀔때마다 실행됨!
            print("☕️")
            closure?()// 2. 클로저 전체 옵셔널이니까 옵셔널 체이닝
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    // 4. 얘를 넣어보자
    func test(_ closure: @escaping () -> Void) {
        print("Food class - test")
        closure() // 🥟
        self.closure = closure
    }
    
}
