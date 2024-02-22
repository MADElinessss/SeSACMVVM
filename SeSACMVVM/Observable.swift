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
    
    var text: String {
        didSet {
            closure?(text)
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print("bind")
        closure(text)
        self.closure = closure
    }
}
