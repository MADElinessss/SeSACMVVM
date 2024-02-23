//
//  LoginViewModel.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/23/24.
//

import Foundation

class LoginViewModel {
    
    var inputText = Observable("maddie@naver.com")
    var inputPassword = Observable("")
    
    var outputText = Observable("")
    var outputColor = Observable(false)
    
    init() {
        inputText.bind { value in
            self.validation(email: value, pw: self.inputPassword.value)
        }
        inputPassword.bind { value in
            self.validation(email: self.inputText.value, pw: value)
        }
    }
    
    private func validation(email: String, pw: String) {
        if email.count >= 3 && pw.count > 5 {
            outputText.value = "\(email), \(pw)"
            outputColor.value = true
        } else {
            outputText.value = "잘못 입력했어요."
            outputColor.value = false
        }
    }
    
    
    
}
