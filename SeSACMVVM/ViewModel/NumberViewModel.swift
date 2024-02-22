//
//  NumberViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import Foundation

class NumberViewModel {
    // MARK: DidSet으로 값 변경 감지
//    var inputText: String? = "" {
//        didSet {
//            numberValidation()
//        }
//    }
    var inputText = Observable("🐢")// 여기부터 다시해
    
    // MARK: Observable로 값 변경 감지
    var outputResult = Observable("🐶")
    
    init() {
        inputText.bind { value in // value: inputText.text
            self.numberValidation(value)
        }
    }
    
    private func numberValidation(_ text: String) {
        // let text = inputText.text
        // guard let text = inputText else { return }
        // 1. 빈값 처리
        if text.isEmpty {
            outputResult.text = "값을 입력해주세요."
        }
        // 2. 문자열 예외처리
        guard let num = Int(text) else {
            outputResult.text = "숫자만 입력해주세요."
            return
        }
        // 3. 숫자 쉼표처리
        if num > 0, num <= 10000000 {
            let format = NumberFormatter()
            format.numberStyle = .decimal // 숫자 쉼표 처리
            if let result = format.string(for: num) {
                outputResult.text = "\(result) 원"
            }
        } else {
            outputResult.text = "천만원 이하로 입력해주세요."
        }
    }
}
