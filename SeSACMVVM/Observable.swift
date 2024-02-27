//
//  Observable.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

// 실시간으로 달라지는 데이터를 감지
class Observable<T> {
    
    private var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        // print("bind")
        closure(value)
        self.closure = closure
    }
}
