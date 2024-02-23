//
//  LoginViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = LoginViewModel()
    
    var passwordText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputText.bind { value in
            self.resultLabel.text = value
            
        }
        
        viewModel.outputColor.bind { value in
            self.resultLabel.textColor = value ? .green : .red
        }
        
        passwordField.text = passwordText
        
        emailField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        
    }
    
    @objc func emailChanged() {
        guard let text = emailField.text else { return }
        viewModel.inputText.value = text
    }
    @objc func passwordChanged() {
        guard let text = passwordField.text else { return }
        viewModel.inputPassword.value = text
    }
    
}
