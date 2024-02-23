//
//  Observable.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

// 실시간으로 달라지는 데이터를 감지
class Observable {
    
    private var closure: ((String) -> Void)?
    
    var value: String {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: String) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print("bind")
        closure(value)
        self.closure = closure
    }
}
