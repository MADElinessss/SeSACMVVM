//
//  NumberViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

class NumberViewModel {
    
    func numberValidation(_ inputText: String?) -> String {
        guard let text = inputText else { return "" }
        // 1. 빈값 처리
        if text.isEmpty {
            return "값을 입력해주세요."
        }
        // 2. 문자열 예외처리
        guard let num = Int(text) else {
            return "숫자만 입력해주세요."
        }
        
        // 3. 숫자 쉼표처리
        if num > 0, num <= 1000000 {
            let format = NumberFormatter()
            format.numberStyle = .decimal // 숫자 쉼표 처리
            if let result = format.string(for: num) {
                return "\(result) 원"
            }
        } else {
            return "백만원 이하로 입력해주세요."
        }
        
        return ""
    }
}
