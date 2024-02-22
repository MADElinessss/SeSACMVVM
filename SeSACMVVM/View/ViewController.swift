//
//  ViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

 import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    @objc func numberTextFieldChanged() {
        resultLabel.text = viewModel.numberValidation(numberTextField.text)
    }
}

