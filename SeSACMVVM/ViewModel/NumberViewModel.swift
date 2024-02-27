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
    
    // MARK: next 버튼 누르면 TestVC로 화면전환
    var inputNextButtonTappedTrigger: Observable<Void?> = Observable(nil)
    
    // 화면 전환 output
    var outputTransition: Observable<Void?> = Observable(nil)
    
    var inputText = Observable("🐢")// 여기부터 다시해
    
    // MARK: Observable로 값 변경 감지
    var outputResult = Observable("🐶")
    
    init() {
        inputText.bind { value in // value: inputText.text
            self.numberValidation(value)
        }
        
        inputNextButtonTappedTrigger.bind { _ in
            // 여기서 화면 전환하면 넘 좋겠따 근데 뷰모델은 UI몰라
            self.outputTransition.value = ()
        }
    }
    
    private func numberValidation(_ text: String) {
        // let text = inputText.text
        // guard let text = inputText else { return }
        // 1. 빈값 처리
        if text.isEmpty {
            outputResult.value = "값을 입력해주세요."
        }
        // 2. 문자열 예외처리
        guard let num = Int(text) else {
            outputResult.value = "숫자만 입력해주세요."
            return
        }
        // 3. 숫자 쉼표처리
        if num > 0, num <= 10000000 {
            //            let format = NumberFormatter()
            //            format.numberStyle = .decimal // 숫자 쉼표 처리
            //            if let result = FormatterManager.shared.calculator(num) {
            //                outputResult.value = "\(result) 원"
            //            }
            
            let result = FormatterManager.shared.calculator(num)
            outputResult.value = "\(result) 원"
            
        } else {
            outputResult.value = "천만원 이하로 입력해주세요."
        }
    }
}
