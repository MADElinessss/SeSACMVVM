//
//  FormatterManager.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import Foundation

class FormatterManager {
    
    static let shared = FormatterManager()
    
    private init() { }
    
    // 1. 이렇게 해도 되고
    private let numberFormatter = NumberFormatter()
    // 한번 만든 이상, 로드되어서 내려가지 않고 유지될 거야
    // 계속 쓸거면 올려놓고 써
    
    func calculator(_ number: Int) -> String {
        // 2. 이렇게 해도 됨
        // let numberFormatter = NumberFormatter()
        // 메서드 실행할때마다 이 인스턴스가 로드됨
        // 한번만 쓰면 요렇게
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: number as NSNumber)
        
        return result ?? "0"
    }
    
}
